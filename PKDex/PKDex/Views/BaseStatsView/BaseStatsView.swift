//
//  BaseStatsView.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class BaseStatsView: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Status Base"
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 22)
        view.textAlignment = .center
        return view
    }()
    
    var container: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
}
extension BaseStatsView: CodeView {

    func addViews() {
        self.addSubview(title)
        self.addSubview(container)
    }
    
    func addConstraints() {
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true

        container.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func registerLevelPowers(_ stats: [Stats]) {
        let _ = stats.map {
            let levelPower = LevelPower()
            let level = CGFloat(Float($0.baseStat) / 100)
            self.container.addArrangedSubview(levelPower)
            let replaceAttack  = $0.stat.name.replacingOccurrences(of: "attack", with: "ATK")
            let replaceDefense  = replaceAttack.replacingOccurrences(of: "defense", with: "DEF")
            levelPower.nameStatus.text = replaceDefense.replacingOccurrences(of: "special-", with: "SP ").uppercased()
            levelPower.numberStatus.text = "\($0.baseStat)"
            levelPower.startAnimated(level: level)
        }
    }
    
}
