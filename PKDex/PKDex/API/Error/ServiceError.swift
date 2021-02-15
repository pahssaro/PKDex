//
//  ServiceError.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Foundation
import Moya

protocol Response {
    var statusCode: Int { get }
    var data: Data { get }
    var request: URLRequest? { get }
    var response: URLResponse? { get }
}

enum ServiceError: Swift.Error {
    case statusCode(code: Int, response: Response)
    case unexpected
    case notConnectedToInternet
    case parsingError
}

extension Moya.Response: Response {
    var response: URLResponse? {
        return nil
    }
}

extension ServiceError: Equatable {
    static func == (lhs: ServiceError, rhs: ServiceError) -> Bool {
        switch (lhs, rhs) {
        case let (.statusCode(lhsCode, lhsResponse), .statusCode(rhsCode, rhsResponse)):
            return lhsCode == rhsCode
                && (lhsResponse.data == rhsResponse.data
                    && lhsResponse.request == rhsResponse.request
                    && lhsResponse.response == rhsResponse.response
                    && lhsResponse.statusCode == rhsResponse.statusCode)
        case (.unexpected, .unexpected): return true
        case (.notConnectedToInternet, .notConnectedToInternet): return true
        case (.parsingError, .parsingError): return true
        default: return false
        }
    }
}
