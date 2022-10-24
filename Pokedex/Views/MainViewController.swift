//
//  MainViewController.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 12/09/2022.
//

import UIKit

final class MainViewController: UIViewController {
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
}
