//
//  PokeIndicator.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 13/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class PokeIndicator: UIView {
    
    var isLoad = false
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let loadImage: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "loading")
        return view
    }()
    
    func animateInnerRing(){
        self.loadImage.rotate()
    }
    
    func startAnimating(){
        if !isLoad {
            self.isLoad = true
            self.isHidden = false
            self.animateInnerRing()
        }
    }
    
    func stopAnimating(){
        self.isLoad = false
        self.isHidden = true
        self.layer.removeAllAnimations()
    }
}

extension PokeIndicator: CodeView {
    func addViews() {
        self.addSubview(self.loadImage)
    }
    
    func addConstraints() {
        loadImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loadImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loadImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
}
