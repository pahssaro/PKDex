//
//  HomeCoordinator.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

/// Serviço responsável pela gerenciamento da navegação.
protocol HomeCoordinatorService: Coordinator {
    func showPokemonDetails(_ pokemon: Pokemon)
    func back()
}

/// `Coordinator` responsável pelas transições de telas do aplicativo.
final class HomeCoordinator {
    
    /// `UINavigationController` responsável pelo `Coordinator`.
    var navigationController: UINavigationController
    
    private lazy var pokemonService: PokemonService = {
        return PokemonService()
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// Inicializa o fluxo de telas.
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorService {
    func showPokemonDetails(_ pokemon: Pokemon) {
        let viewModel = PokemonViewModel(pokemon, coordinator: self)
        let viewController = PokemonDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    /// Volta para a tela anterior.
    func back() {
        navigationController.popViewController(animated: true)
    }
}
