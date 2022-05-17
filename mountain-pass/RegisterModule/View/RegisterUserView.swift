//
//  LaunchScreenView.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import UIKit

class RegisterUserView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
//        self.title = "Добро пожаловать"
        // Do any additional setup after loading the view.
    }
    
// MARK: - Properties
    
    var presenter: RegisterUserPresenterProtocol!
    
//    lazy var
//
//    lazy var contentView: UIContentView = {
////        let contentView = UIContentView()
//        return contentView
//    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 21
        return stackView
    }()
    
    lazy var tabBar: UITabBarController = {
        let tabBar = UITabBarController()
        
        return tabBar
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Conforming 'RegisterUserPresenterProtocol'

extension RegisterUserView: RegisterUserViewProtocol {
    
}

// MARK: - Setup UI

extension RegisterUserView {
    private func setupUI() {
        
    }
}
