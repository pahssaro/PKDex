//
//  ServiceSetupSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble
import Moya

@testable import PKDex

class ServiceSetupMock: ServiceSetup {

    var endpoint: String = "abc"

    var method: Moya.Method = Method.get

    var parameters: [String : Any]? = ["abc": 123]
}

class ServiceSetupSpec: QuickSpec {
    override func spec() {
        describe("ServiceSetup") {

            var sut: ServiceSetup!

            beforeEach {
                sut = ServiceSetupMock()
            }

            afterEach {
                sut = nil
            }
            
            it("should have a endpoint") {
                expect(sut.endpoint).to(equal("abc"))
            }
            
            it("should have a method") {
                expect(sut.method).to(equal(Method.get))
            }

            it("should have a path") {
                expect(sut.path).to(equal("abc"))
            }
            
        }
    }
}

