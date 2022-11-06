//
//  LoginViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var option = 0
    
    var segControl: UISegmentedControl = {
        let segmentItems = ["Войти", "Зарегистрироваться"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0

        return control
    }()


    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Почтовый адрес"
//        emailField.layer.borderWidth = 1
        emailField.borderStyle = UITextField.BorderStyle.roundedRect
        emailField.autocorrectionType = UITextAutocorrectionType.no
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()

    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Пароль"
        passwordField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordField.autocorrectionType = UITextAutocorrectionType.no

        passwordField.isSecureTextEntry = true
        passwordField.keyboardType = .emailAddress
        passwordField.autocapitalizationType = .none
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))

        return passwordField
    }()

    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Продолжить", for: .normal)
        button.layer.cornerRadius = 5

        return button
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Выйти", for: .normal)
        button.layer.cornerRadius = 5

        return button
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(segControl)

        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(signOutButton)
        signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width - 40, height: 50)
        signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        signOutButton.isHidden = true

        if FirebaseAuth.Auth.auth().currentUser != nil {
            segControl.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            button.isHidden = true
            
            signOutButton.isHidden = false
        }
    }
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            segControl.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            button.isHidden = false
            
            signOutButton.isHidden = true
        } catch {
            print("an error occurred")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segControl.frame = CGRect(x: 20, y: 98, width: view.frame.size.width - 40, height: 40)

        emailField.frame = CGRect(x: 20,
                                  y: segControl.frame.origin.y+segControl.frame.size.height+30,
                                  width: view.frame.size.width - 40,
                                  height: 50)
        
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y+emailField.frame.size.height+10,
                                     width: view.frame.size.width - 40,
                                     height: 50)
        
        button.frame = CGRect(x: 20,
                              y: passwordField.frame.origin.y+passwordField.frame.size.height+30,
                              width: view.frame.size.width - 40,
                              height: 50)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    
    @objc private func didTapButton() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            
            button.backgroundColor = .red
            button.setTitle("Заполните поля", for: .normal)
            
            let timer = Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { timer in
                self.button.backgroundColor = UIColor(named: "AccentColor")
                self.button.setTitle("Продолжить", for: .normal)
            }

            return
        }
        
        // Get auth instance
        // attempt sign in
        // if failure, present alert to create account
        // if user continues, create account
        
        // check sign in on app launch
        // allow user to to sign out with button
        if option == 0 {  // login
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
                // couldn't sign the user in with this
                guard let strongSelf = self else {
                    return
                }
                
                guard error == nil else {
                    // show account creation
                    
                    //                print("error")
                    //                print(error)
                    //
                    //                if error!.localizedDescription == "The password is invalid or the user does not have a password." {
                    strongSelf.button.backgroundColor = .red
                    strongSelf.button.setTitle("Не удалось войти", for: .normal)
                    
                    let timer = Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { timer in
                        strongSelf.button.backgroundColor = UIColor(named: "AccentColor")
                        strongSelf.button.setTitle("Продолжить", for: .normal)
                    }
                    //                    return
                    //                }
                    //
                    //                strongSelf.showCreateAccount(email: email, password: password)
                    print("Login failed")

                    return
                }
                
                print ("You have signed in")
                
                strongSelf.signOutButton.isHidden = false
                
                strongSelf.segControl.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.button.isHidden = true
                
                strongSelf.emailField.resignFirstResponder()
                strongSelf.passwordField.resignFirstResponder()
                
            })
        } else {  // register
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
                
                guard let strongSelf = self else {
                    return
                }

                guard error == nil else {
                    // show account creation
                    
                    strongSelf.button.backgroundColor = .red
                    strongSelf.button.setTitle("Не удалось зарегистрироваться", for: .normal)
                    
                    let timer = Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { timer in
                        strongSelf.button.backgroundColor = UIColor(named: "AccentColor")
                        strongSelf.button.setTitle("Продолжить", for: .normal)
                    }

                    print("Account creation failed")
                    return
                }
                
                print ("You have signed in")

                strongSelf.segControl.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.button.isHidden = true

                strongSelf.signOutButton.frame = CGRect(x: 20, y: 150, width: strongSelf.view.frame.size.width - 40, height: 50)
                strongSelf.signOutButton.isHidden = false
                
                strongSelf.emailField.resignFirstResponder()
                strongSelf.passwordField.resignFirstResponder()
            })
        }
    }
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Создать аккаунт",
                                      message: "Вы хотите создать аккаунт?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
                
                guard let strongSelf = self else {
                    return
                }

                guard error == nil else {
                    // show account creation
                    print("Account creation failed")
                    return
                }
                
                print ("You have signed in")
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.button.isHidden = true

                strongSelf.signOutButton.frame = CGRect(x: 20, y: 150, width: strongSelf.view.frame.size.width - 40, height: 50)
                strongSelf.signOutButton.isHidden = false
                
                strongSelf.emailField.resignFirstResponder()
                strongSelf.passwordField.resignFirstResponder()
            })
        }))
        alert.addAction(UIAlertAction(title: "Отменить",
                                      style: .cancel,
                                      handler: {_ in
            
        }))
        
        present(alert, animated: true)
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            button.setTitle("Войти", for: .normal)
            option = 0
        case 1:
            button.setTitle("Зарегистрироваться", for: .normal)
            option = 1
        default:
            break
        }
    }
}
