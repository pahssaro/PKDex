//
//  BaseStatsViewSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import PKDex

class BaseStatsViewSpec: QuickSpec {
    override func spec() {
        
        describe("Test UI BaseStatsView") {
            
            var view: BaseStatsView!
            var pokemon: Pokemon!
            
            beforeEach {
                pokemon = PokemonMock.create().make()
                let frame =  CGRect(x: 0, y: 0, width: 350, height: 300 )
                view = BaseStatsView(frame: frame)
                view.registerLevelPowers(pokemon.stats)
            }
            
            afterEach {
                pokemon = nil
                view = nil
            }
            
            it("should have a valid snapshot") {
                expect(view) == snapshot("BaseStatsView")
            }
        }
    }
}
