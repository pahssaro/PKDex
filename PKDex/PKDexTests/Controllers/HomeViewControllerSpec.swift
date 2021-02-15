//
//  HomeViewControllerSpec.swift
//  PKDexTests
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import PKDex

class HomeViewControllerSpec: QuickSpec {
    override func spec() {
        describe("HomeViewControllerSpec") {
            var sut: HomeViewController!
            var nav: UINavigationController!
            var viewModel: HomeViewModel!
            var pokemons: ListPokemon!

            beforeEach {
                nav = UINavigationController()
                pokemons = ListPokemonMock.create().make()
                viewModel = HomeViewModel(coordinator: HomeCoordinator(navigationController: nav))
                viewModel.pokemons = pokemons.infos!
                sut = HomeViewController(viewModel: viewModel)
                UIWindow.setTestWindow(rootViewController: sut)
            }
            
            afterEach {
                sut = nil
                UIWindow.cleanTestWindow()
            }
            
            context("when view is instanciated", {
                
                it("should have a valid snapshot") {
                    expect(UIWindow.testWindow) == snapshot("HomeViewController")
                }
                
                it("teste last visible cell error") {
                    expect(sut.tableView.isLastVisibleCell(at: IndexPath(row: 10, section: 0))).to(equal(false))
                }
                
                it("teste push id") {
                    expect(viewModel.getNamePokemon(id: 0)).to(equal("a"))
                }
            })
            
            context("when view is instanciated", {
                
                it("Validade Number of Row") {
                    expect(viewModel.numberOfRowsInSection()).to(equal(3))
                }
                
                it("Validade heigth of Row") {
                    expect(viewModel.heightForRowAt()).to(equal(70))
                }
            })
        }
    }
}
