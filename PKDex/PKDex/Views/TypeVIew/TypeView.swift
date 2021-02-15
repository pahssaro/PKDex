//
//  TypeView.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class TypeView: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var type: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Tipo"
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 22)
        view.textAlignment = .center
        return view
    }()
    
    var containerTypes: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
}

extension TypeView: CodeView {
    func addViews() {
        self.addSubview(type)
        self.addSubview(containerTypes)
    }
    
    func addConstraints() {
        type.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        type.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        type.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        type.heightAnchor.constraint(equalToConstant: 30).isActive = true

        containerTypes.topAnchor.constraint(equalTo: type.bottomAnchor, constant: 5).isActive = true
        containerTypes.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerTypes.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerTypes.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func registerTypes(_ types: [Types]) {
        let _ = types.map {
            let imageView = UIImageView()
            imageView.image = UIImage(named: $0.type.name)
            imageView.contentMode = .scaleAspectFit
            containerTypes.addArrangedSubview(imageView)
        }
    }
}

