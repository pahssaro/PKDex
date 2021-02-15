//
//  DetailSceneSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import PKDex

class DetailSceneSpec: QuickSpec {
    
    override func spec() {
        
        describe("Test UI DetailScene") {
            
            var background: UIView!
            var view: DetailScene!
            var pokemon: Pokemon!
            
            beforeEach {
                let frame =  CGRect(x: 0, y: 0, width: 375, height: 300 )
                background = UIView(frame: frame)
                view = DetailScene()
                background.addSubview(view)
                pokemon = PokemonMock.create().make()

                view.leadingAnchor.constraint(equalTo: background.leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: background.trailingAnchor).isActive = true
                view.topAnchor.constraint(equalTo: background.topAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: background.bottomAnchor).isActive = true
                
                view.setupImage(URL(string: pokemon.sprites.other.dreamWorld.frontDefault))
            }
            
            afterEach {
                background = nil
                view = nil
                pokemon = nil
            }
            
            it("should have a valid snapshot") {
                expect(view) == snapshot("DetailScene")
            }
        }
    }
}
