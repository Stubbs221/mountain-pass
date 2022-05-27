//
//  AddPathScreenBuilder.swift
//  mountain-pass
//
//  Created by Vasily on 21.05.2022.
//

import Foundation
import UIKit

protocol AddPassScreenBuilderProtocol {
    static func createAddPassScreen() -> UIViewController
}

class AddPassScreenBuilder: AddPassScreenBuilderProtocol {
    static func createAddPassScreen() -> UIViewController {
        let model = MountainPass()
        let view = AddPassView()
        let presenter = AddPassPresenter(view: view, model: model)
        view.presenter = presenter
        
        return view
    }
    
    
}
