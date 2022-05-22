//
//  LaunchScreenPresenter.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import Foundation
import UIKit
import RealmSwift

protocol RegisterUserViewProtocol {
    func onUserRegisterFailure(message: String)
    func onUserRegisterSuccess(message: String)
}

protocol RegisterUserPresenterProtocol {
    init(view: RegisterUserViewProtocol, model: User)
    func registerUserBtnPressed(firstName: String, middleName: String, lastName: String, email: String, phoneNumber: String, socialNetworkURL: String)
}

class RegisterUserPresenter: RegisterUserPresenterProtocol {
    
    
    let view: RegisterUserViewProtocol!
    let model: User!
    let realm = try! Realm()
    
    required init(view: RegisterUserViewProtocol, model: User) {
        self.view = view
        self.model = model
    }
    
    func registerUserBtnPressed(firstName: String, middleName: String, lastName: String, email: String, phoneNumber: String, socialNetworkURL: String) {
        print("View notifies the presenter that Add button was pressed")
        registerUser(firstName: firstName, middleName: middleName, lastName: lastName, email: email, phoneNumber: phoneNumber, socialNetworkURL: socialNetworkURL)
    }
    
    func registerUser(firstName: String, middleName: String, lastName: String, email: String, phoneNumber: String, socialNetworkURL: String) {
        print("Presenter adds User to Realm Data Base")
        let user = User(firstName: firstName, middleName: middleName , lastName: lastName, email: email, phoneNumber: phoneNumber, socialNetworks: socialNetworkURL)
        print("Presenter receives lastName: \(lastName)")
        do {
            try self.realm.write{
                self.realm.add(user)
            }
        } catch {
            view?.onUserRegisterFailure(message: error.localizedDescription)
        }
        
        view?.onUserRegisterSuccess(message: "User item added to Realm Data Base")
    }
}
