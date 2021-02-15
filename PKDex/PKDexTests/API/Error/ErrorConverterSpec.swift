//
//  ErrorConverterSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Moya
import Quick
import Nimble

@testable import PKDex

class ErrorConverterSpec: QuickSpec {

    override func spec() {
        describe("ErrorConverter") {

            var converter: ErrorConverter!

            beforeEach {
                converter = ErrorConverter()
            }

            context("when pass a parsingError error", {

                it("should  returns model mappingError", closure: {
                    let moyaError: Moya.MoyaError = .jsonMapping(Moya.Response(statusCode: 0, data: Data()))
                    let convertedError = converter.convert(moyaError)
                    expect(convertedError).to(equal(ServiceError.parsingError))
                })
            })

            context("when pass a status code error", {
                it("should returns status code ErrorWithCodeAndResponse", closure: {
                    let response = Moya.Response(statusCode: 100, data: Data())
                    let moyaError: Moya.MoyaError = .statusCode(response)
                    let convertedError = converter.convert(moyaError)
                    expect(convertedError).to(equal(ServiceError.statusCode(code: 100, response: response)))
                })
            })

            context("when pass a underlying error about no connected to internet", {
                it("should return not connected to internet error", closure: {
                    let response = Response(statusCode: 400, data: Data())
                    let error = NSError(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: nil)
                    let moyaError: Moya.MoyaError = .underlying(error, response)
                    let convertedError = converter.convert(moyaError)
                    expect(convertedError).to(equal(ServiceError.notConnectedToInternet))
                })
            })

            context("when pass a underlying error", {
                it("should return unexpected", closure: {
                    let response = Response(statusCode: 500, data: Data())
                    let error = NSError(domain: "", code: 0, userInfo: nil)
                    let moyaError: Moya.MoyaError = .underlying(error, response)
                    let convertedError = converter.convert(moyaError)
                    expect(convertedError).to(equal(ServiceError.unexpected))
                })
            })

            context("when pass a not expected error", {
                it("should return unexpected error", closure: {
                    let response = Moya.Response(statusCode: 0, data: Data())
                    let moyaError: Moya.MoyaError = .imageMapping(response)
                    let convertedError = converter.convert(moyaError)
                    expect(convertedError).to(equal(ServiceError.unexpected))
                })
            })
        }
    }
}
