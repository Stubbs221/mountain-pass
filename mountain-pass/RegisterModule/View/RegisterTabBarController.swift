//
//  ProfileTabBarController.swift
//  mountain-pass
//
//  Created by Vasily on 17.05.2022.
//

import UIKit

class RegisterTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BasicLightGrayColor")
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        let nav = generateNavController(vc: RegisterScreenBuilder.createRegisterScreen(), image: UIImage(systemName: "line.3.horizontal")!)
        let nav1 = generateNavController(vc: RegisterScreenBuilder.createRegisterScreen(), image: UIImage(named: "Vector.png")!)
        let nav2 = generateNavController(vc: RegisterScreenBuilder.createRegisterScreen(), image: UIImage(systemName: "magnifyingglass")!)
        UINavigationBar.appearance().prefersLargeTitles = false
        viewControllers = [nav, nav1, nav2]
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    fileprivate func generateNavController(vc: UIViewController, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = image
        UITabBar.appearance().tintColor = .black
        
        
        vc.navigationItem.title = "Добро пожаловать"
        let atributes = [NSAttributedString.Key.font: UIFont(name: "DINPro", size: 20)!]
//        .appearance().titleTextAttributes = atributes
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BasicLightGrayColor")
        appearance.titleTextAttributes = atributes
        appearance.shadowColor = .black
        appearance.backgroundColor = .white
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance

        return navController
        
    }
    
    func restoreAppearance() {
            }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
