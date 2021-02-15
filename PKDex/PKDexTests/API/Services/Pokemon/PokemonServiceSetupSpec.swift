//
//  PokemonServiceSetupSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble
import Moya

@testable import PKDex

class PokemonServiceSetupSpec: QuickSpec {
    override func spec() {
        describe("PokemonServiceSetupSpec") {

            var sut: PokemonSetup!

            afterEach {
                sut = nil
            }

            context("fetchPokemons") {
                beforeEach {
                    sut = PokemonSetup.fetchPokemons(10)
                }
                it("should have method get") {
                    expect(sut.method).to(equal(.get))
                }

                it("should have endpoint") {
                    expect(sut.endpoint).to(equal("/pokemon?offset=10"))
                }

                it("should have empty headers") {
                    expect(sut.headers).to(beNil())
                }
            }
            
            context("fetchPokemons") {
                beforeEach {
                    sut = PokemonSetup.fetchPokemonDetail("1")
                }
                it("should have method get") {
                    expect(sut.method).to(equal(.get))
                }

                it("should have endpoint") {
                    expect(sut.endpoint).to(equal("/pokemon/1"))
                }

                it("should have empty headers") {
                    expect(sut.headers).to(beNil())
                }
            }
        }
    }
}
