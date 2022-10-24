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
        
        let gradients: [GradientColor] = [GradientColor(color: .cultured, location: 0.4),
                                          GradientColor(color: .systemBackground, location: 0.0)]
        
        background.image = .pokeball.maskWithGradientColor(gradients)
        background.contentMode = .scaleAspectFit
        return background
    }()
    
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
        addSubview(backgroundImage)
    }
    
    func setupConstraints() {
        backgroundImage.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: leadingAnchor, constant: 8)
            view.trailingAnchor(equalTo: trailingAnchor, constant: -8)
            view.centerYAnchor(equalTo: topAnchor)
        }
    }
    
    func configureView() {
        backgroundColor = .systemBackground
    }
    
    func setupTouchEvents() {
    }
}
