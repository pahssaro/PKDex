//
//  ListPokemonSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble

@testable import PKDex

class ListPokemonSpec: QuickSpec {
    override func spec() {
        describe("ListPokemonSpec") {

            var sut: ListPokemon!

            afterEach {
                sut = nil
            }

            describe("when parse data JSON") {
                it("should create instance") {
                    sut = ListPokemonMock.create().make()
                    expect(sut).toNot(beNil())
                }

                it("should create instance count pokemons") {
                    sut = ListPokemonMock.create().make()
                    expect(sut.infos?.count).to(equal(3))
                }
            }
        }
    }
}
