//
//  CodeView.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

protocol CodeView {
    func addViews()
    func addConstraints()
    func addConfigurations()
    func setupView()
}

extension CodeView {
    func setupView() {
        addViews()
        addConstraints()
        addConfigurations()
    }
    
    func addConfigurations() {}
}
