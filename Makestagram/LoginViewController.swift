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
