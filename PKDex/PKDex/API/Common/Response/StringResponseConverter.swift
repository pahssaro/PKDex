//
//  StringResponseConverter.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

class StringResponseConverter: CustomResponseConverter<String> {

    required init(_ keyPath: String) {
        super.init {
            return try $0.mapString(atKeyPath: keyPath)
        }
    }
}
