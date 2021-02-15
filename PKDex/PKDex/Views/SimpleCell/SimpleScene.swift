//
//  SimpleScene.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class SimpleScene: UIView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let background : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    let icon : ImageLoader = {
        let view = ImageLoader()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let name : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

extension SimpleScene: CodeView {
    func addViews() {
        self.addSubview(background)
        background.addSubview(icon)
        background.addSubview(name)
    }
    
    func addConstraints() {
        background.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        background.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        background.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        icon.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 5).isActive = true
        icon.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.2).isActive = true
        icon.heightAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.15).isActive = true
        icon.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true

        name.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 5).isActive = true
        name.centerYAnchor.constraint(equalTo: icon.centerYAnchor).isActive = true
    }
    
    func setupImage(_ url: URL?) {
        if let imageURL = url {
            self.icon.loadImageWithUrl(imageURL)
        }
    }
}
