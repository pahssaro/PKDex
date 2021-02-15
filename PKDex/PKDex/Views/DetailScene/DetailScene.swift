//
//  DetailScene.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class DetailScene: UIView, UIScrollViewDelegate {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    var detailView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(white: 0.8, alpha: 0.7)
        view.roundCorners(corners: [.topRight, .topLeft], radius: 30)
        return view
    }()
    
    var image: ImageLoader = {
        let view = ImageLoader()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     var mainContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.spacing = 15
        view.axis = .vertical
        return view
       }()
    
    lazy var scroll: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.alwaysBounceHorizontal = false
        return view
      }()
    
    var typeView = TypeView()
    
    var baseStats = BaseStatsView()
    
    var abilities = AbilitieView()
    
    var sizePokemon = TwoLabelsView()
    
    var infPokeder = TwoLabelsView()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}

extension DetailScene: CodeView {
    
    func addViews() {
        self.addSubview(detailView)
        self.addSubview(image)
        self.detailView.addSubview(scroll)
        scroll.addSubview(mainContainer)
        self.mainContainer.addArrangedSubview(baseStats)
        self.mainContainer.addArrangedSubview(typeView)
        self.mainContainer.addArrangedSubview(abilities)
        self.mainContainer.addArrangedSubview(sizePokemon)
        self.mainContainer.addArrangedSubview(infPokeder)
    }
    
    func addConstraints() {
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        image.bottomAnchor.constraint(equalTo: detailView.topAnchor, constant: 30).isActive = true
        
        detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        detailView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55).isActive = true
        
        scroll.bottomAnchor.constraint(equalTo: detailView.bottomAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 15).isActive = true
        scroll.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -15).isActive = true
        scroll.topAnchor.constraint(equalTo: detailView.topAnchor).isActive = true
        
        mainContainer.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        mainContainer.leadingAnchor.constraint(equalTo: scroll.leadingAnchor).isActive = true
        mainContainer.trailingAnchor.constraint(equalTo: scroll.trailingAnchor).isActive = true
        mainContainer.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 5).isActive = true
        mainContainer.widthAnchor.constraint(equalTo: scroll.widthAnchor).isActive = true
        
        baseStats.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        typeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        abilities.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        sizePokemon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        infPokeder.heightAnchor.constraint(equalToConstant: 80).isActive = true

    }

    func setupImage(_ url: URL?) {
        if let imageURL = url {
            self.image.loadImageWithUrl(imageURL)
        }
    }
    
}
