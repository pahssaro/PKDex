//
//  StringResponseConverterSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble
import Moya

@testable import PKDex

class StringResponseConverterSpec: QuickSpec {
    override func spec() {
        describe("StringResponseConverterSpec") {

            var sut: StringResponseConverter!

            afterEach {
                sut = nil
            }

            context("when string converter response") {
                it("should have success parse response string") {
                    sut = StringResponseConverter("token")

                    let json: [String: Any?] = ["abc":["cde":123,"efg":"xpto"],"token": "123abc"]

                    let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

                    let response = Moya.Response(statusCode: 200, data: data!)

                    let model = try? sut.convert(response)

                    expect(model).toNot(beNil())
                }

                it("should have failure parse response string") {
                    sut = StringResponseConverter("abc")

                    let json: [String: Any?] = ["abc":["cde":123,"efg":"xpto"]]

                    let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

                    let response = Moya.Response(statusCode: 200, data: data!)

                    let model = try? sut.convert(response)

                    expect(model).to(beNil())
                }
            }
        }
    }
}
