//
//  GoogleServices.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import Foundation
import GoogleSignIn
import Google

public class GoogleServices: NSObject {
    public static let shared = GoogleServices()
    public typealias LoginHandler = (UserDelegate?, Error?) -> Void
    
    fileprivate var loginHandler: LoginHandler?
    fileprivate var viewController: UIViewController?
    
    var user: UserDelegate!
    
    public func configure() {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        GIDSignIn.sharedInstance().delegate = self
    }
    
    public func handleURL(url: URL, sourceApplication: String, annotation: Any?) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    public func login(viewController: UIViewController, completion: @escaping LoginHandler) {
        self.loginHandler = completion
        self.viewController = viewController
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    public func signOut() {
        GIDSignIn.sharedInstance().signOut()
    }
}

extension GoogleServices: GIDSignInDelegate, GIDSignInUIDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {
            self.loginHandler!(nil, error)
            return
        }
        self.user = user
        self.loginHandler!(user, nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // when user disconnects from app
    }
    
    public func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.viewController?.present(viewController, animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}

extension GIDGoogleUser: UserDelegate {
    public var firstName: String {
        return self.profile.givenName
    }
    
    public var lastName: String {
        return self.profile.familyName
    }
    
    public var email: String {
        return self.profile.email
    }
}
