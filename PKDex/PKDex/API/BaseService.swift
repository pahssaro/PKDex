//
//  API.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya

protocol BaseService {
    associatedtype Service: ServiceSetup

    var provider: MoyaProvider<Service> { get }
    var errorConverter: ErrorConverter { get }
}

extension BaseService {
    var errorConverter: ErrorConverter { return ErrorConverter() }

    var provider: MoyaProvider<Service> {
        return MoyaProvider<Self.Service>(endpointClosure: { setup -> Endpoint in
            let url = setup.baseURL.appendingPathComponent(setup.path).absoluteString.removingPercentEncoding!

            return Endpoint(url: url, sampleResponseClosure: { () -> EndpointSampleResponse in
                .networkResponse(200, setup.sampleData)
            }, method: setup.method,
               task: Task.requestParameters(parameters: setup.parameters ?? [:],
                                            encoding: setup.parameterEncoding),
                                            httpHeaderFields: setup.headers)
        }, plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
    }
    
    func provider(with url: URL) -> MoyaProvider<Self.Service> {
        return MoyaProvider<Self.Service>(
            endpointClosure: { (setup: Self.Service) -> Endpoint in
                return Endpoint(
                    url: url.absoluteString,
                    sampleResponseClosure: { .networkResponse(200, setup.sampleData) },
                    method: setup.method,
                    task: Task.requestParameters(parameters: setup.parameters ?? [:],
                                                 encoding: setup.parameterEncoding),
                                                 httpHeaderFields: setup.headers)
        }, plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
    }
    
    func handle<T>(result: Result<Moya.Response, Moya.MoyaError>,
                   converter: ResponseConverter<T>,
                   service: ServiceSetup) -> Result<T, ServiceError> {
        switch result {
        case let .success(response):
            switch response.statusCode {
            case 200...299:
                do {
                    let model = try converter.convert(response)
                    return .success(model)
                } catch let error as Moya.MoyaError {
                    return .failure(errorConverter.convert(error))
                } catch {
                    return .failure(.unexpected)
                }
            default:
                return .failure(errorConverter.convert(.statusCode(response)))
            }
        case let .failure(error):

            return .failure(errorConverter.convert(error))
        }
    }
}
