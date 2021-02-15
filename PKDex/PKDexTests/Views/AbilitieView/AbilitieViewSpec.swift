//
//  AbilitieViewSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import PKDex

class AbilitieViewSpec: QuickSpec {
    override func spec() {
        
        describe("Test UI AbilitieViewSpec") {
            
            var view: AbilitieView!
            var pokemon: Pokemon!
            
            beforeEach {
                let frame =  CGRect(x: 0, y: 0, width: 375, height: 80 )
                view = AbilitieView(frame: frame)
                pokemon = PokemonMock.create().make()
                
                view.registerAbilities(pokemon!.abilities)
            }
            
            afterEach {
                view = nil
                pokemon = nil
            }
            
            it("should have a valid snapshot") {
                expect(view) == snapshot("AbilitieView")
            }
        }
    }
}
