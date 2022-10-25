//
//  PokemonCard.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit

final class PokemonCard: UIView, ViewCodable {
    // MARK: - Properties
    private let typeOne: PokemonType
    private let typeTwo: PokemonType?
    
    private lazy var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = typeOne.backgroundColor
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        return view
    }()
    
    private let number: UILabel = {
        let label = UILabel()
        label.text = "#001"
        label.textColor = .textNumber
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.text = "Bulbasaur"
        label.textColor = .systemBackground
        
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        return label
    }()
    
    private let pokemonImage: UIImageView = {
        let view = UIImageView(image: UIImage.bulbasaur)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let dotsImage: UIImageView = {
        let dotsImage = UIImage.dotsMedium
        let dotsWithGradient = dotsImage.maskWithGradientColor(GradientColor.vectorGradient)
        
        let view = UIImageView(image: dotsWithGradient)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let pokeballImage: UIImageView = {
        let pokeballImage = UIImage.pokeball
        let pokeballWithGradient = pokeballImage.maskWithGradientColor(GradientColor.vectorGradient)
        
        let view = UIImageView(image: pokeballWithGradient)
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private lazy var firstBadge: Badge = {
        return Badge(typeOne)
    }()
    
    private lazy var secondBadge: Badge? = {
        guard let type = typeTwo else {
            return nil
        }
        
        return Badge(type)
    }()
    
    // MARK: - Initializers
    init(typeOne: PokemonType, typeTwo: PokemonType? = nil) {
        self.typeOne = typeOne
        self.typeTwo = typeTwo
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
}

extension PokemonCard {
    func buildViewHierarchy() {
        backgroundView.addSubviews([pokeballImage,
                                    dotsImage,
                                    number,
                                    name,
                                    firstBadge])
        
        if let badge = secondBadge {
            backgroundView.addSubview(badge)
        }
        
        addSubviews([backgroundView, pokemonImage])
    }
    
    func setupConstraints() {
        layout.applyConstraint { view in
            view.heightAnchor(equalToConstant: 140)
        }
        
        backgroundView.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: leadingAnchor, constant: 40)
            view.trailingAnchor(equalTo: trailingAnchor, constant: -40)
            view.heightAnchor(equalToConstant: 115)
            view.bottomAnchor(equalTo: bottomAnchor, constant: -20)
        }
        
        number.layout.applyConstraint { view in
            view.topAnchor(equalTo: backgroundView.topAnchor, constant: 20)
            view.leadingAnchor(equalTo: backgroundView.leadingAnchor, constant: 20)
        }
        
        name.layout.applyConstraint { view in
            view.topAnchor(equalTo: number.bottomAnchor)
            view.leadingAnchor(equalTo: number.leadingAnchor)
            view.heightAnchor(equalToConstant: 32)
        }
        
        firstBadge.layout.applyConstraint { view in
            view.topAnchor(equalTo: name.bottomAnchor)
            view.leadingAnchor(equalTo: number.leadingAnchor)
            view.heightAnchor(equalToConstant: 25)
        }
        
        if let badge = secondBadge {
            badge.layout.applyConstraint { view in
                view.topAnchor(equalTo: name.bottomAnchor)
                view.leadingAnchor(equalTo: firstBadge.trailingAnchor, constant: 5)
                view.heightAnchor(equalToConstant: 25)
            }
        }
        
        pokemonImage.layout.applyConstraint { view in
            view.topAnchor(equalTo: backgroundView.topAnchor, constant: -20)
            view.bottomAnchor(equalTo: bottomAnchor, constant: -20)
            view.trailingAnchor(equalTo: backgroundView.trailingAnchor)
            view.leadingAnchor(equalTo: backgroundView.centerXAnchor)
        }
        
        dotsImage.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: backgroundView.leadingAnchor, constant: 90)
            view.topAnchor(equalTo: backgroundView.topAnchor, constant: 5)
            view.trailingAnchor(equalTo: backgroundView.trailingAnchor, constant: -170)
            view.bottomAnchor(equalTo: backgroundView.bottomAnchor, constant: -78)
        }
        
        pokeballImage.layout.applyConstraint { view in
            view.topAnchor(equalTo: backgroundView.topAnchor, constant: -15)
            view.trailingAnchor(equalTo: backgroundView.trailingAnchor, constant: 15)
            view.bottomAnchor(equalTo: backgroundView.bottomAnchor, constant: 15)
        }
    }
    
    func configureView() {
        backgroundColor = .clear
    }
    
    func setupTouchEvents() {
    }
}
