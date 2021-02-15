//
//  TwoLabelsView.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 14/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class TwoLabelsView: UIView {
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
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 22)
        view.textAlignment = .center
        return view
    }()
    
    var content: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
}

extension TwoLabelsView: CodeView {
    func addViews() {
        self.addSubview(title)
        self.addSubview(content)
    }
    
    func addConstraints() {
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true

        content.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        content.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func set(_ title: String, content: String) {
        self.title.text = title
        self.content.text = content
    }
    
    
}

