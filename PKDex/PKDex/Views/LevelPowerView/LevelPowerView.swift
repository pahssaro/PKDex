//
//  LevelPower.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class LevelPower: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .darkText
        return label
    }()
    
    let numberStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let levelBackgroundStatus: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.bounds.height / 2
        return view
    }()
    
    let levelSetStatus: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.bounds.height / 2
        return view
    }()
}

extension LevelPower: CodeView {
    
    func addViews() {
        self.addSubview(nameStatus)
        self.addSubview(numberStatus)
        self.addSubview(levelBackgroundStatus)
        levelBackgroundStatus.addSubview(levelSetStatus)
    }
    
    func addConstraints() {
        nameStatus.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameStatus.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        nameStatus.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        nameStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        numberStatus.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        numberStatus.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        numberStatus.leadingAnchor.constraint(equalTo: nameStatus.trailingAnchor).isActive = true
        numberStatus.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1).isActive = true
        
        levelBackgroundStatus.leadingAnchor.constraint(equalTo: numberStatus.trailingAnchor, constant: 5).isActive = true
        levelBackgroundStatus.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        levelBackgroundStatus.heightAnchor.constraint(equalToConstant: 2).isActive = true
        levelBackgroundStatus.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        levelSetStatus.leadingAnchor.constraint(equalTo: levelBackgroundStatus.leadingAnchor).isActive = true
        levelSetStatus.topAnchor.constraint(equalTo: levelBackgroundStatus.topAnchor).isActive = true
        levelSetStatus.bottomAnchor.constraint(equalTo: levelBackgroundStatus.bottomAnchor).isActive = true
    }
    
    func startAnimated(level: CGFloat) {
        let anchorW = self.levelSetStatus.widthAnchor.constraint(equalTo: self.levelBackgroundStatus.widthAnchor, multiplier: 1)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
                anchorW.isActive = true
                self.layoutIfNeeded()
            }) { (_) in
                UIView.animate(withDuration: 0.7, delay: 0.1, options: .curveEaseOut, animations: {
                    anchorW.isActive = false
                    self.levelSetStatus.widthAnchor.constraint(equalTo: self.levelBackgroundStatus.widthAnchor, multiplier: level).isActive = true
                    self.layoutIfNeeded()
                })
            }
        }
    }
    
}
