//
//  CustomResponseConverter.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya

class CustomResponseConverter<T: Any>: ResponseConverter<T> {
    private var converter: ((Moya.Response) throws -> T)

    init(converter: @escaping ((Moya.Response) throws -> T)) {
        self.converter = { try converter($0) }
    }

    override func convert(_ response: Moya.Response) throws -> T {
        return try converter(response)
    }
}
