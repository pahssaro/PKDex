//
//  AbilitiesViewSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import PKDex

class AbilitiesViewSpec: QuickSpec {
    override func spec() {
        describe("Test UI AbilitiesView") {
            var background: UIView!
            var view: AbilitiesView!
            
            beforeEach {
                let frame =  CGRect(x: 0, y: 0, width: 375, height: 80 )
                background = UIView(frame: frame)
                view = AbilitiesView()
                background.addSubview(view)

                view.leadingAnchor.constraint(equalTo: background.leadingAnchor).isActive = true
                view.trailingAnchor.constraint(equalTo: background.trailingAnchor).isActive = true
                view.topAnchor.constraint(equalTo: background.topAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: background.bottomAnchor).isActive = true
                
                
                view.name.text = "Teste de UI"
            }
            
            afterEach {
                view = nil
                background = nil
            }
            
            it("should have a valid snapshot") {
                expect(view) == snapshot("AbilitieView")
            }
        }
    }
}
