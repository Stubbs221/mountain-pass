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
    
}

protocol RegisterUserPresenterProtocol {
    init(view: RegisterUserViewProtocol, model: User)
}

class RegisterUserPresenter: RegisterUserPresenterProtocol {
    
    let view: RegisterUserViewProtocol!
    let model: User!
    
    required init(view: RegisterUserViewProtocol, model: User) {
        self.view = view
        self.model = model
    }
}
