//
//  ProfileScreenBuilder.swift
//  mountain-pass
//
//  Created by Vasily on 20.05.2022.
//

import Foundation
import UIKit

protocol ProfileScreenBuilderProtocol {
    static func createProfileScreen() -> UIViewController
}
class ProfileScreenBuilder: ProfileScreenBuilderProtocol {
    static func createProfileScreen() -> UIViewController {
        let view = ProfileView()
        let model = User()
        let presenter = ProfilePresenter(view: view, model: model)
        view.presenter = presenter
        
        return view
    }
    
    
}
