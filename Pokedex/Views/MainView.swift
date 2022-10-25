//
//  MainView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 16/09/2022.
//

import UIKit
import SketchKit
import WolmoCore

final class MainView: UIView, ViewCodable {
    // MARK: - Properties
    private let backgroundImage: UIImageView = {
        let background = UIImageView()
        
        background.image = .pokeball.maskWithGradientColor(GradientColor.pokeballGradient)
        background.contentMode = .scaleAspectFill
        return background
    }()
    
    private let pokemonCard = PokemonCard(typeOne: .grass, typeTwo: .poison)
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
}

extension MainView {
    func buildViewHierarchy() {
        addSubviews([backgroundImage, pokemonCard])
    }
    
    func setupConstraints() {
        backgroundImage.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: leadingAnchor, constant: 8)
            view.trailingAnchor(equalTo: trailingAnchor, constant: -8)
            view.centerYAnchor(equalTo: topAnchor)
        }
        
        pokemonCard.layout.applyConstraint { view in
            view.widthAnchor(equalTo: widthAnchor)
            view.topAnchor(equalTo: topAnchor, constant: 100)
        }
    }
    
    func configureView() {
        backgroundColor = .systemBackground
    }
    
    func setupTouchEvents() {
    }
}
