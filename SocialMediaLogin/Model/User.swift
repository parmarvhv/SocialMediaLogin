//
//  User.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import Foundation

public protocol UserDelegate {
    var name:String { get }
    var email:String? { get }
}

public class User {
    public var name: String
    public var email: String?
    
    public init(name: String, email: String?) {
        self.name = name
        self.email = email
    }
}

extension User: UserDelegate {
    
}
