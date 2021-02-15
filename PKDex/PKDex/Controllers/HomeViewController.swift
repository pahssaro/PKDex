//
//  HomeViewController.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @AutoLayout var tableView: UITableView
    
    let pokeLoad = PokeIndicator()
        
    /// `ViewMoodel` responsável por esta classe.
    private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.register()
        self.setupTableView()
        self.setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.clear()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        pokeLoad.isHidden = true
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.sectionIndexColor = .clear
    }

    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
    }
    
    /// Registro da `SimpleCell`
    private func register() {
        tableView.register(SimpleCell.self, forCellReuseIdentifier: SimpleCell.self.description())
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellForRowAt(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startAnimated()
        viewModel.showPokemonDetails(for: viewModel.getNamePokemon(id: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel.willDisplay(tableView, cell, forRowAt: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let index = tableView.indexPathsForVisibleRows?.last?.row {
            viewModel.paginate(index)
        }
    }
}


// MARK: - CodeView
extension HomeViewController: CodeView {
    func addViews() {
        self.view.addSubview(tableView)
        self.view.addSubview(pokeLoad)
    }
    
    func addConstraints() {
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        pokeLoad.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pokeLoad.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pokeLoad.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        pokeLoad.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func addConfigurations() {
        tableView.register(SimpleCell.self, forCellReuseIdentifier: "cellId")
        stopAnimated()
    }
    
    func startAnimated() {
        self.pokeLoad.startAnimating()
    }
    
    func stopAnimated() {
        self.pokeLoad.stopAnimating()
    }
}

extension HomeViewController: StatusCodeViewModelDelegate {
    func callFinished() {
        tableView.reloadData()
    }
}
