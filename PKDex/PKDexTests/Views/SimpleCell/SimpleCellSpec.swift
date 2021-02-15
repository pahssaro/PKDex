//
//  SimpleCellSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import PKDex

class SimpleCellSpec: QuickSpec {
    
    override func spec() {
        
        describe("Test UI SimpleScene") {
            
            var view: SimpleCell!
            var pokemon: Pokemon!
            
            beforeEach {
                pokemon = PokemonMock.create().make()
                let frame =  CGRect(x: 0, y: 0, width: 375, height: 300 )
                view = SimpleCell(frame: frame)
                
                view.scene.setupImage(URL(string: pokemon.sprites.other.dreamWorld.frontDefault))
                view.scene.name.text = pokemon.name
            }
            
            afterEach {
                view = nil
                pokemon = nil
            }
            
            it("should have a valid snapshot") {
                expect(view) == snapshot("SimpleCellSpec")
            }
        }
    }
}
