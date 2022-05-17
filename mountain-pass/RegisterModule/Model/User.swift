//
//  User.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var middleName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phoneNumber: String? = nil
    @objc dynamic var socialNetworks: String? = nil
    
    convenience init(firstName: String, middleName: String, lastName: String, email: String, phoneNumber: String?, socialNetworks: String?) {
        self.init()
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.socialNetworks = socialNetworks
    }
}
