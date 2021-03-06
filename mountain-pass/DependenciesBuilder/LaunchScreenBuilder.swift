//
//  LaunchScreenBuilder.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import Foundation
import UIKit
import RealmSwift

protocol BuilderProtocol {
    static func createLaunchScreen() -> UIViewController
    static func isUserEmpty() -> Bool
    
}

class Builder: BuilderProtocol {
    static func isUserEmpty() -> Bool {
        let realm = try! Realm()
        let user = realm.objects(User.self)
        
        return user.isEmpty
    }
    static func createLaunchScreen() -> UIViewController {
        
       
        let model = User()
        let view = LoginView()
        let presenter = LoginPresenter(view: view, model: model)
        view.presenter = presenter
        return view
//        let view: UIViewController!
//        let model = User()
        
//        let realm = try! Realm()
//        var user: Results<User>?
//        if let _ =  user?.isEmpty {
//            view = LoginView()
//            let presenter = LoginPresenter(view: view, model: model)
//            view.presenter = presenter
//        } else {
//            view = ProfileView()
//            let presenter = ProfilePresenter(view: view, model: model)
//            view.presenter = presenter
//        }
//        return view
    }
}
