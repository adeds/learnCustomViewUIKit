//
//  ViewController.swift
//  learnCustomViewUIKit
//
//  Created by Sampingan on 18/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension LoginViewController {
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signinTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signinTapped(sender: UIButton) {
        
    }
}
