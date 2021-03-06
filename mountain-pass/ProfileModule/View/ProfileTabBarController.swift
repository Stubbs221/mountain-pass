//
//  ProfileTabBarController.swift
//  mountain-pass
//
//  Created by Vasily on 20.05.2022.
//

import UIKit
import RealmSwift

class ProfileTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BasicLightGrayColor")
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        let nav = generateNavController(vc: ProfileScreenBuilder.createProfileScreen(), image: UIImage(systemName: "line.3.horizontal")!)
        let nav1 = generateNavController(vc: ProfileScreenBuilder.createProfileScreen(), image: UIImage())
        let nav2 = generateNavController(vc: ProfileScreenBuilder.createProfileScreen(), image: UIImage(systemName: "magnifyingglass")!)
        UINavigationBar.appearance().prefersLargeTitles = false
        viewControllers = [nav, nav1, nav2]
        setupMiddleButton()
        
        
        
        // Do any additional setup after loading the view.
    }
    
//    MARK: Properies
    
    let realm = try! Realm()
    
    
    lazy var logOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(logOutPressed))
        button.tintColor = .black
        
        
        
        
        return button
    }()
    
//    MARK: Actiona
    @objc func addPassPressed() {
        let vc = AddPassScreenBuilder.createAddPassScreen()
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = "Добавление перевала"
        let atributes = [NSAttributedString.Key.font: UIFont(name: "DINPro", size: 20)!]
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BasicLightGrayColor")
        appearance.titleTextAttributes = atributes
        appearance.shadowColor = .black
        appearance.backgroundColor = .white
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance


        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
    @objc func logOutPressed() {
        do {
            try realm.write{
                realm.deleteAll()
            }
        } catch {
            print("Unable to delete objects from Realm DataBase, \(error.localizedDescription)")
        }
        
        let vc = Builder.createLaunchScreen()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    fileprivate func generateNavController(vc: UIViewController, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        
        let user = realm.objects(User.self)
        print("User firstName is: \(user.compactMap({ $0.middleName })[0])")
        print("User secondName is: \(user.compactMap({$0.lastName})[0])")
        let userName = user.compactMap({ $0.firstName })[0] + " " + user.compactMap({$0.middleName})[0]
        
        navController.tabBarItem.image = image
        
        UITabBar.appearance().tintColor = .black
        
        
        vc.navigationItem.title = userName
        vc.navigationItem.rightBarButtonItem = logOutButton
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
    
    fileprivate func setupMiddleButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var buttonFrame = button.frame
        buttonFrame.origin.y = view.bounds.height - buttonFrame.height - 50
        buttonFrame.origin.x = view.bounds.width/2 - buttonFrame.width/2
        button.frame = buttonFrame
        button.setImage(UIImage(named: "addPassIcon"), for: .normal)
        button.addTarget(self, action: #selector(addPassPressed), for: .touchUpInside)
        view.addSubview(button)
        
//        button.setImage(UIImage(named: "Glass"), for: .normal)
        
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
