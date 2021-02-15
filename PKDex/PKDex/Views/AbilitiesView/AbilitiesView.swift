//
//  AbilitiesView.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class AbilitiesView: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.roundCorners(corners: .allCorners, radius: 5)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var name: UILabel = {
         let view = UILabel()
         view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizesSubviews = true
        view.textAlignment = .center
         return view
    }()
}

extension AbilitiesView: CodeView {
    
    func addViews() {
        self.addSubview(name)
    }
    
    func addConstraints() {
        name.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        name.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }

}
