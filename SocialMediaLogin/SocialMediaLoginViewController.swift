//
//  ViewController.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import UIKit

class SocialMediaLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleGoogleConnectTapped(_ sender: Any) {
        GoogleServices.shared.login(viewController: self) { (user, error) in
            if error == nil {
                guard let name = user?.name, let email = user?.email else { return }
                print("Google User: \n Name: \(name) \n Email: \(email)")
            }
        }
    }
    
    @IBAction func handleFBConnectTapped(_ sender: Any) {
        FacebookServices.shared.login(viewController: self) { (user) in
            guard let user = user else { return }
            print("Facebook user: \n Name: \(user.name) \n Email: \(user.email ?? "No Email Attached")")
        }
    }
    
    @IBAction func handleTwitterTapped(_ sender: Any) {
        TwitterServices.shared.login { (user) in
            guard let user = user else { return }
            print("Facebook user: \n Name: \(user.name) \n Email: \(user.email ?? "No Email Attached")")
        }
    }
    
    @IBAction func handleLinkedINTapped(_ sender: Any) {
        
    }
}

