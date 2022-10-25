//
//  Badge.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit
import SketchKit

class Badge: UIView, ViewCodable {
    // MARK: - Properties
    private let type: PokemonType
    
    private lazy var iconView: UIImageView = {
        let image = type.iconImage
        
        let view = UIImageView(image: image)
        
        view.contentMode = .scaleAspectFit
        view.tintColor = .white
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = type.name
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Initializers
    init(_ type: PokemonType) {
        self.type = type
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Badge {
    func buildViewHierarchy() {
        addSubviews([iconView, titleLabel])
    }
    
    func setupConstraints() {
        iconView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 5)
            view.bottomAnchor(equalTo: bottomAnchor, constant: -5)
            view.leadingAnchor(equalTo: leadingAnchor)
        }
        
        titleLabel.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: iconView.centerYAnchor)
            view.leadingAnchor(equalTo: iconView.trailingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor, constant: -5)
        }
    }
    
    func configureView() {
        backgroundColor = type.iconColor
        layer.cornerRadius = 3
    }
    
    func setupTouchEvents() {
    }
}
