//
//  PokemonDetailViewController.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    /// `ViewMoodel` responsável por esta classe.
    private var viewModel: PokemonViewModel
    private var scene = DetailScene()
    
    /// `Variables` to test
    var setBackgroundColor = false
    
    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupScene(viewModel)
        self.title =  viewModel.getName()
        setupBackgroundRadomColor()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.clear()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        scene.needsUpdateConstraints()
    }
    
    func setupBackgroundRadomColor(color: UIColor? = nil) {
        var newColor = UIColor.random()
        if color != nil {
            newColor = color!
        }
        self.view.backgroundColor = newColor
        setBackgroundColor = true
    }
}

extension PokemonDetailViewController: CodeView {
    func addViews() {
        self.view.addSubview(scene)
    }
    
    func addConstraints() {
        scene.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scene.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scene.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scene.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    fileprivate func setupScene(_ viewModel: PokemonViewModel) {
        scene.setupImage(viewModel.getImagePokemon())
        scene.baseStats.registerLevelPowers(viewModel.getStats())
        scene.abilities.registerAbilities(viewModel.getAbilitiesView())
        scene.typeView.registerTypes(viewModel.getTypes())
        scene.infPokeder.set("Numero do registro na pokedex", content: "#\(viewModel.getOrder())")
        scene.sizePokemon.set("Curiosidades", content: viewModel.getSize())
    }
}
