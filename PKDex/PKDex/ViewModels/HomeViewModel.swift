//
//  HomeViewModel.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

protocol StatusCodeViewModelDelegate: class {
    func callFinished()
    func stopAnimated()
}

/// `ViewModel` responsável pela `HomeViewModelViewController`.
final class HomeViewModel {
    
    /// `Coordinator` associado com esse `ViewModel`.
    private let coordinator: HomeCoordinatorService
    
    var pokemons: [PokemonInfo] = []
    weak var delegate: StatusCodeViewModelDelegate?
    private var paginate: Int = 0
    private var isLoad: Bool = true
    var id: String? = ""
    
    private lazy var service: PokemonService = {
        return PokemonService()
    }()
    
    /// Inicializador
    /// - Parameter coordinator: O coordinator controla todas as operações de navegação entre telas.
    init(coordinator: HomeCoordinatorService) {
        self.coordinator = coordinator
        self.fetchPokemons(paginate)
    }
    
    func fetchPokemons(_ paginate: Int) {
        let interactor = PokemonInteractor(didFail: { (error) in
            print(error)
        }, didReceivePokemons: { (pokemons) in
            self.pokemons.append(contentsOf: pokemons)
            self.delegate?.callFinished()
            self.isLoad = !self.isLoad
        }, service: service)
        interactor.fetchPokemons(paginate)
    }
    
    func fetchPokemonDetail(_ name: String) {
        let interactor = PokemonInteractor(didFail: { (error) in
            print(error)
            self.delegate?.stopAnimated()
        }, didReceivePokemonDetail: { (pokemon) in
            self.delegate?.stopAnimated()
            self.delegate?.callFinished()
            self.isLoad = !self.isLoad
            self.coordinator.showPokemonDetails(pokemon)
        }, service: service)
        interactor.fetchPokemonDetail(for: name)
    }
    
    func heightForRowAt() -> CGFloat {
        return 70
    }
    
    func cellForRowAt(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? SimpleCell {
            let pokemon = pokemons[indexPath.row]
            let id = "\(indexPath.row + 1)"
            cell.setUpView(pokemon: pokemon, id: id)
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfRowsInSection() -> Int {
        return pokemons.count
    }
    
    func willDisplay(_ tableView: UITableView,_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationCell.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 1.0, delayFactor: 0.01)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    func paginate(_ lastIndexRowVisible: Int) {
        if lastIndexRowVisible == (pokemons.count - 1) && !isLoad {
            isLoad = !isLoad
            paginate = paginate + 20
            fetchPokemons(paginate)
        }
    }
    
    func showPokemonDetails(for id: String) {
        isLoad = !isLoad
        fetchPokemonDetail(id)
    }
    
    func getNamePokemon(id: Int) -> String {
        return self.pokemons[id].name ?? ""
    }
}
