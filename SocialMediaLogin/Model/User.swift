//
//  User.swift
//  SocialMediaLogin
//
//  Created by Vaibhav Parmar on 26/10/17.
//  Copyright © 2017 Vaibhav Parmar. All rights reserved.
//

import Foundation

//public class User {
//    var firstName: String
//    var lastName: String
//    var email: String?
//    
//    public init(firstName: String, lastName: String, email: String?) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//    }
//}

public protocol User {
    var firstName:String { get }
    var lastName:String { get }
    var email:String { get }
}
