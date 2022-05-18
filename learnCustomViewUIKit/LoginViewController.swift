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
    let errorMessageLabel = UILabel()
    
    var username : String? {
        return loginView.userNameTextField.text
    }
    
    var password : String? {
        return loginView.passwordTextField.text
    }
    
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
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Error Failure"
        errorMessageLabel.isHidden = true
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
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
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signinTapped(sender: UIButton) {
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username or password is nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            showErrorLabel(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "adeds" && password == "mypass" {
            signInButton.configuration?.showsActivityIndicator = true
            showErrorLabel(withMessage: nil)
        } else {
            showErrorLabel(withMessage: "Username / Password incorrect")
        }
    }
    
    private func showErrorLabel(withMessage message: String?){
        if message == nil {
            errorMessageLabel.isHidden = true
            return
        }
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
