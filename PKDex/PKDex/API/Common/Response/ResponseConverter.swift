//
//  ResponseConverter.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya

class ResponseConverter<T> {
    open func convert(_ response: Moya.Response) throws -> T {
        guard T.self != Void.self else { return () as! T }
        preconditionFailure("This method must be overriden")
    }
}
