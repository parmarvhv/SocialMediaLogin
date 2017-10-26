//
//  Facebook Services.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import Foundation
import FBSDKLoginKit

fileprivate let requestParameters = ["fields": "id, name, first_name, last_name, email"]

public class FacebookServices {
    
    public static let shared = FacebookServices()
    public typealias LoginHandler = (User?) -> Void
    
    var dictonary: [String: Any]!
    var user: User!
    
    fileprivate var loginHandler: LoginHandler?
    
    public func configure(application: UIApplication, options: [AnyHashable: Any]?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: options)
    }
    
    public func activateApp() {
        FBSDKAppEvents.activateApp()
    }
    
    public func application(_ application: UIApplication!, open url: URL!, options: [UIApplicationOpenURLOptionsKey: Any]! = [:]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, options: options)
    }
    
    public func login(viewController: UIViewController, completion: @escaping LoginHandler) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: viewController) { (result, error) in
            guard error != nil, result?.grantedPermissions != nil, (result?.grantedPermissions.contains("email"))! else { return }
            guard FBSDKAccessToken.current() != nil else { fbLoginManager.logOut(); return }
            FBSDKGraphRequest(graphPath: "me", parameters: requestParameters).start(completionHandler: {
                (connection, result, error) in
                guard error != nil else { return }
                self.dictonary = result as! [String: Any]
                completion(User(name: self.name, email: self.email))
            })
        }
    }
}

extension FacebookServices {
    public var name: String {
        return self.dictonary["name"] as! String
    }
    
    public var email: String {
        return self.dictonary["email"] as! String
    }
}
