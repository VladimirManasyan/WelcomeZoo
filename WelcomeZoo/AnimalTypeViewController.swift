//
//  AnimalTypeViewController.swift
//  WelcomeZoo
//
//  Created by Vova on 23.05.22.
//

import UIKit

class AnimalTypeViewController: UIViewController {
    
    var stackView: UIStackView!
    var animal: ReusableView!
    var animalsImage: [String] = ["Mammals", "Insects", "Fishs", "Birds"]
    var animalsType: [String] = [
        NSLocalizedString("Mammals", comment: ""),
        NSLocalizedString("Insects", comment: ""),
        NSLocalizedString("Fishs", comment: ""),
        NSLocalizedString("Birds", comment: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initStackView()
        initAnimalType()
        activatConstraints()
        view.backgroundColor = .white
    }
    
    @objc func buttonPressed() {
        let viewController = TableViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AnimalTypeViewController {
    func initStackView() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    func initAnimalType() {
        for index in animalsImage {
            animal = ReusableView()
            animal.text(name: NSLocalizedString(index, comment: ""))
            animal.setImage(name: index)
            animal.animalTypeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            animal.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(animal)
        }
    }
    
    func activatConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
