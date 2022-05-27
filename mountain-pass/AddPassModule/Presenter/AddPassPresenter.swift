//
//  AddPassPresenter.swift
//  mountain-pass
//
//  Created by Vasily on 21.05.2022.
//

import Foundation

protocol AddPassViewProtocol {
    
}

protocol AddPassPresenterProtocol {
    init(view: AddPassViewProtocol, model: MountainPass)
}

class AddPassPresenter: AddPassPresenterProtocol {
    let view: AddPassViewProtocol!
    let model: MountainPass!
    
    required init(view: AddPassViewProtocol, model: MountainPass) {
        self.view = view
        self.model = model
    }
}


