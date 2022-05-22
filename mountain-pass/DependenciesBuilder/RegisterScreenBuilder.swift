//
//  RegisterScreenBuilder.swift
//  mountain-pass
//
//  Created by Vasily on 20.05.2022.
//

import Foundation
import UIKit

protocol RegisterScreenBuilderProtocol {
    static func createRegisterScreen() -> UIViewController
}

class RegisterScreenBuilder: RegisterScreenBuilderProtocol {
    static func createRegisterScreen() -> UIViewController {
        
        let model = User()
        let view = RegisterUserView()
        let presenter = RegisterUserPresenter(view: view, model: model)
        view.presenter = presenter
        
        return view
        
    }
    
    
}
