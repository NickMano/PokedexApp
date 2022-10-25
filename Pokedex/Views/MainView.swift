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
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Pokédex"
        label.font = .applicationTitle
        
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "Search for Pokémon by name or using the National Pokédex number."
        label.font = .description
        label.textColor = .textGrey
        label.numberOfLines = 0
        
        return label
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
        addSubviews([backgroundImage,
                     title,
                     subtitle,
                     pokemonCard])
    }
    
    func setupConstraints() {
        backgroundImage.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: leadingAnchor, constant: 8)
            view.trailingAnchor(equalTo: trailingAnchor, constant: -8)
            view.centerYAnchor(equalTo: topAnchor)
        }
        
        title.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 38)
            view.leadingAnchor(equalTo: leadingAnchor, constant: 40)
            view.trailingAnchor(equalTo: trailingAnchor, constant: -40)
        }
        
        subtitle.layout.applyConstraint { view in
            view.topAnchor(equalTo: title.bottomAnchor, constant: 10)
            view.leadingAnchor(equalTo: title.leadingAnchor)
            view.trailingAnchor(equalTo: title.trailingAnchor)
        }
        
        pokemonCard.layout.applyConstraint { view in
            view.widthAnchor(equalTo: widthAnchor)
            view.topAnchor(equalTo: subtitle.bottomAnchor, constant: 20)
        }
    }
    
    func configureView() {
        backgroundColor = .systemBackground
    }
    
    func setupTouchEvents() {
    }
}
