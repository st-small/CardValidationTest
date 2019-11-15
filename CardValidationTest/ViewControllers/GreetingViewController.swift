//
//  GreetingViewController.swift
//  CardValidationTest
//
//  Created by Станислав Шияновский on 11/15/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

public class GreetingViewController: UIViewController {
    
    // MARK: UI elements -
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I've prepared for you the list of payment cards. You can check what are valid of them very quickly. Just use my own framework...\nPlease, try to test it!"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Let's start!", for: .normal)
        return button
    }()
    
    public override func loadView() {
        super.loadView()

        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        view.addSubview(actionButton)
        actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        actionButton.addTarget(self, action: #selector(toValidationTapped), for: .touchUpInside)
    }
    
    @objc
    private func toValidationTapped() {
        let validationController = MainViewController()
        let navigation = UINavigationController(rootViewController: validationController)
        show(navigation, sender: nil)
    }
}
