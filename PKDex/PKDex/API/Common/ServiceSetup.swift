//
//  ServiceSetup.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya

protocol ServiceSetup: TargetType {
    var pathPrefix: String? { get }
    var endpoint: String { get }
    var headers: [String: String]? { get }
    var parameterEncoding: ParameterEncoding { get }
    var parameters: [String: Any]? { get }
}

extension ServiceSetup {
    var baseURL: URL { return URL(string: "https://pokeapi.co/api/v2")!}
    var parameterEncoding: ParameterEncoding { return URLEncoding.default }
    var pathPrefix: String? { return nil }
    var sampleData: Data { return Data() }
    var task: Task { return .requestPlain }
    var path: String { return endpoint }

    var headers: [String: String]? { return nil }
}
