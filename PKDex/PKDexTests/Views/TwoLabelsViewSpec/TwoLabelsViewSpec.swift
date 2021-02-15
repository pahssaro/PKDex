//
//  TwoLabelsViewSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble_Snapshots
import Nimble

@testable import PKDex

class TwoLabelsViewSpec: QuickSpec {
    override func spec() {
        describe("Test UI TwoLabelsViewSpec") {
            let frame =  CGRect(x: 0, y: 0, width: 375, height: 80 )
            let view = TwoLabelsView(frame: frame)
            
            beforeEach {
                view.set("primeira label", content: "segunda label")
            }
            
            it("view") {
                expect(view) == snapshot("TwoLabelsViewSpec")
            }
        }
    }
}
