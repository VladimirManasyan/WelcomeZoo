//
//  ViewController.swift
//  WelcomeZoo
//
//  Created by Vova on 23.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    var labelWelcome: UILabel!
    var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBarRightButtopn()
        initlabelWelcome()
        initGetStartedButton()
        constructHierarchy()
        activatConstraints()
        view.backgroundColor = .white
    }
    
    @objc func buttonPressed() {
        let viewController = AnimalTypeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func tapped() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }

}

extension ViewController {
    func initNavigationBarRightButtopn() {
        let navigationBarRightButtopn = UIBarButtonItem(title: "Language", style: .plain, target: self, action: #selector(tapped))
        navigationItem.rightBarButtonItem = navigationBarRightButtopn
    }
    
    func initlabelWelcome() {
        labelWelcome = UILabel()
        labelWelcome.text = NSLocalizedString("Wlcome", comment: "")
        labelWelcome.font = UIFont.systemFont(ofSize: 30)
        labelWelcome.textAlignment = .center
        labelWelcome.translatesAutoresizingMaskIntoConstraints = false
        labelWelcome.numberOfLines = 0
    }
    
    func initGetStartedButton() {
        getStartedButton = UIButton()
        getStartedButton.setTitle(NSLocalizedString("Button", comment: ""), for: .normal)
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        getStartedButton.backgroundColor = .black
        getStartedButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(labelWelcome)
        view.addSubview(getStartedButton)
    }
    
    func activatConstraints() {
        NSLayoutConstraint.activate([
            labelWelcome.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            labelWelcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            labelWelcome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
