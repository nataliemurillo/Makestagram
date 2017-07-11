//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Natalie Murillo on 6/30/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?){
        if let error = error {
          assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        guard let user = user
            else { return }
        UserService.show(forUID: user.uid) { (user) in
      
        ref.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = User{snapshot: snapshot) {
                User.setCurrent(user)
        
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
               
                }
            } else {
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
                    }
                }
            }
    )}
