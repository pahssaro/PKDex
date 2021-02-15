//
//  ArrayResponseConverter.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya

final class ArrayResponseConverter<T: Codable>: ResponseConverter<[T]> {
    var isToAvoidContainerObject: Bool = false

    override func convert(_ response: Moya.Response) throws -> [T] {
        guard isToAvoidContainerObject else {
            return try JSONDecoder().decode([T].self, from: response.data)
        }

        guard let jsonObject = try JSONSerialization.jsonObject(with: response.data) as? [String: Any], let realArray = jsonObject.first?.value else {
            return try JSONDecoder().decode([T].self, from: response.data)
        }

        let realData = try JSONSerialization.data(withJSONObject: realArray, options: .prettyPrinted)
        return try JSONDecoder().decode([T].self, from: realData)
    }
}
