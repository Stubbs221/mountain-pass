//
//  AddPassNavigationController.swift
//  mountain-pass
//
//  Created by Vasily on 23.05.2022.
//

import UIKit

class AddPassNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
//        navigationController
//        navigationBar.setItems([navTitle], animated: true)
        
        // Do any additional setup after loading the view.
    }
//    MARK: - Properties
    
    lazy var navTitle: UINavigationItem = {
        let title = UINavigationItem()
        title.title = "Добавить перевал"
        return title
    }()
    
//    MARK: - Acions
    
//    func setNavController() {
//        let vc = AddPassView()
//        let navController = UINavigationController(rootViewController: vc)
//        navController.title = "Добавит перевал"
//        present(navController, animated: true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
