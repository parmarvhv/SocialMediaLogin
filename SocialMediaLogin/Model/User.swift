//
//  User.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import Foundation

public protocol UserDelegate {
    var firstName:String { get }
    var lastName:String { get }
    var email:String? { get }
}

public class User {
    public var firstName: String
    public var lastName: String
    public var email: String?
    
    public init(firstName: String, lastName: String, email: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

extension User: UserDelegate {
    
}
