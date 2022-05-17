//
//  LoginPresenter.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import Foundation

protocol LoginViewProtocol {
    
}

protocol LoginPresenterProtocol {
    init(view: LoginViewProtocol, model: User)
}

class LoginPresenter: LoginPresenterProtocol {
    
    let view: LoginViewProtocol!
    let model: User!
    
    
    required init(view: LoginViewProtocol, model: User) {
        self.view = view
        self.model = model
    }
    
    
}
