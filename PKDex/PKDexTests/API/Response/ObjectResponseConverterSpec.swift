//
//  ObjectResponseConverterSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble
import Moya

@testable import PKDex

class ObjectResponseConverterSpec: QuickSpec {
    override func spec() {
        describe("ObjectResponseConverterSpec") {

            var sut: ObjectResponseConverter<ListPokemon>!
            var listPokemon: ListPokemon!
            
            beforeEach {
                sut = ObjectResponseConverter<ListPokemon>()
                listPokemon = ListPokemonMock.create().make()
            }
            afterEach {
                sut = nil
                listPokemon = nil
            }
            context("when converter items response", {
                it("should have success parse response all items", closure: {
                    
                    let jsonData = try! JSONEncoder().encode(listPokemon)
                    let response = Moya.Response(statusCode: 200, data: jsonData)

                    let model = try? sut.convert(response)

                    expect(model).toNot(beNil())
                    expect(model?.next).to(equal("123"))
                })
            })
        }
    }
}
