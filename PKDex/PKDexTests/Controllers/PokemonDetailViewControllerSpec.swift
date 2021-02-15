//
//  PokemonDetailViewControllerSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import PKDex

class PokemonDetailViewControllerSpec: QuickSpec {
    override func spec() {
        describe("PokemonDetailViewControllerSpec") {
            var sut: PokemonDetailViewController!
            var nav: UINavigationController!
            var viewModel: PokemonViewModel!
            var pokemon: Pokemon!

            beforeEach {
                nav = UINavigationController()
                pokemon = PokemonMock.create().make()
                viewModel = PokemonViewModel(pokemon, coordinator: HomeCoordinator(navigationController: nav))
                sut = PokemonDetailViewController(viewModel: viewModel)
                sut.setupBackgroundRadomColor(color: .blue)
                UIWindow.setTestWindow(rootViewController: sut)
            }
            afterEach {
                sut = nil
                UIWindow.cleanTestWindow()
            }

            context("when view is instanciated", {
                it("should have a valid snapshot") {
                    expect(UIWindow.testWindow) == snapshot("PokemonDetailViewController")
                }
                
                it("test set background Color") {
                    expect(sut.setBackgroundColor).to(equal(true))
                }
            })
        }
    }
}
