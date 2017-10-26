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
                guard let firstName = user?.firstName, let lastName = user?.lastName, let email = user?.email else { return }
                print("Google User: \n First Name: \(firstName) \n LastName: \(lastName) \n Email: \(email)")
            }
        }
    }
    
    @IBAction func handleFBConnectTapped(_ sender: Any) {
        
    }
    
    @IBAction func handleTwitterTapped(_ sender: Any) {
        
    }
    
    @IBAction func handleLinkedINTapped(_ sender: Any) {
        
    }
}

