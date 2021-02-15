//
//  ErrorConverter.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya
import Alamofire

struct ErrorConverter {
    func convert(_ error: Moya.MoyaError) -> ServiceError {
        switch error {
        case .jsonMapping:
            return .parsingError

        case let .statusCode(response):
            return .statusCode(code: response.statusCode, response: response)

        case let .underlying(error, _):
            let nsError = error as NSError

            guard nsError.code == NSURLErrorNotConnectedToInternet else {
                return .unexpected
            }

            return .notConnectedToInternet

        default:
            return .unexpected
        }
    }
}
