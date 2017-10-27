//
//  TwitterServices.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import Foundation
import TwitterKit

fileprivate let consumerKey = "EVkz23Qt8FyoTAxSA6f6qgD2X"
fileprivate let consumerSecret = "McMNO9SfxQgaNoB1lxY6BGzggTnzUVQNxcj2VCVoksOkBulqt7"

public class TwitterServices {
    
    public static let shared = TwitterServices()
    public typealias LoginHandler = (User?) -> Void
    
    public func start() {
        Twitter.sharedInstance().start(withConsumerKey: consumerKey, consumerSecret: consumerSecret)
    }

    public func login (completion: @escaping LoginHandler) {
        Twitter.sharedInstance().logIn { (session, error) in
            guard error != nil, let session = session else { return }
            let client = TWTRAPIClient()
            client.loadUser(withID: session.userID, completion: { (user, error) in
                guard error != nil, let user = user else { return }
                completion(User(name: user.name, email: nil))
            })
        }
    }
    
}
