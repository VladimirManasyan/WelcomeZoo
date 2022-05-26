//
//  ReusableView.swift
//  WelcomeZoo
//
//  Created by Vova on 23.05.22.
//

import Foundation
import UIKit


class ReusableView: UIStackView {
    
    var animalTypeButton: UIButton!
    var animalTypeLabel: UILabel!
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        initLabel()
        initButton()
        constructHierarchy()
        activatConstraints()
        spacing = 2
        axis = .vertical
    }
    
    func text(name: String) {
        animalTypeLabel.text = name
    }
    
    func setImage(name:String) {
        animalTypeButton.setImage(UIImage(named: name), for: .normal)
    }
    
}

extension ReusableView {
    func initLabel() {
        animalTypeLabel = UILabel()
        animalTypeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func initButton() {
        animalTypeButton = UIButton()
        animalTypeButton.layer.cornerRadius = 10
        animalTypeButton.clipsToBounds = true
        animalTypeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        addArrangedSubview(animalTypeLabel)
        addArrangedSubview(animalTypeButton)
    }
    
    func activatConstraints() {
        NSLayoutConstraint.activate([
            animalTypeLabel.heightAnchor.constraint(equalToConstant: 20),
            
//            animalTypeButton.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
