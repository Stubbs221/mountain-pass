//
//  ProfilePresenterView.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import UIKit

class ProfileView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    MARK: - Properties
    
    var presenter: ProfilePresenterProtocol!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Conforming to 'ProfileViewProtocol'

extension ProfileView: ProfileViewProtocol {
    
}
