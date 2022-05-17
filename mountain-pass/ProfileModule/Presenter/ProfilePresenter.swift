//
//  ProfilePresenter.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import Foundation

protocol ProfileViewProtocol {
    
}

protocol ProfilePresenterProtocol {
    init(view: ProfileViewProtocol, model: User)
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    let view: ProfileViewProtocol!
    let model: User!
    
    required init(view: ProfileViewProtocol, model: User) {
        self.view = view
        self.model = model
    }
    
    
}
