//
//  LoginView.swift
//  mountain-pass
//
//  Created by Vasily on 16.05.2022.
//

import UIKit

class LoginView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
//    MARK: - Actions
    
    @objc func loginButtonPressed() {
        let registerVC = ProfileTabBarController()
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true, completion: nil)
        
    }
//    MARK: - Properties
    
    var presenter: LoginPresenterProtocol!
    
    lazy var loginButton: UIButton = {
      let button = UIButton()
        
        button.setTitle("ВОЙТИ", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "PT Sans", size: 20)
        
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = button.frame.size.height / 2
        button.layer.cornerRadius = 25
        
        return button
    }()

    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "#ПОХОДЫ #СВОБОДА #ПРЕОДОЛЕНИЯ #ОТКРЫТИЯ"
        label.textColor = .white
        label.font = UIFont(name: "DINPro", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "ОПИШИ ПЕРЕВАЛ"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "PT Sans", size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Наполняем каталог перевалов вместе"
        label.textColor = .white
        label.font = UIFont(name: "PT Sans", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 33")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var adventureMapImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "undraw_adventure_map_hnin")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        
        return image
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

//    MARK: - Conforming 'LoginViewProtocol'

extension LoginView: LoginViewProtocol {
    
}
//    MARK: - UI Setup

extension LoginView {
    private func setupUI() {
        self.view.backgroundColor = UIColor(named: "LoginScreenColor")
        
        self.view.addSubview(loginButton)
        self.view.addSubview(firstLabel)
        self.view.addSubview(secondLabel)
        self.view.addSubview(thirdLabel)
        self.view.addSubview(logoImage)
        self.view.addSubview(adventureMapImage)
        
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            logoImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor, multiplier: (logoImage.image?.size.height)! / (logoImage.image?.size.width)!),

            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)])
        
        NSLayoutConstraint.activate([
            adventureMapImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            adventureMapImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            adventureMapImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            adventureMapImage.heightAnchor.constraint(equalTo: adventureMapImage.widthAnchor, multiplier: (adventureMapImage.image?.size.height)! / (adventureMapImage.image?.size.width)!),
            adventureMapImage.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 24)])

        NSLayoutConstraint.activate([
            firstLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            firstLabel.widthAnchor.constraint(equalToConstant: 300),
            firstLabel.topAnchor.constraint(equalTo: adventureMapImage.bottomAnchor, constant: 25)])
        
        NSLayoutConstraint.activate([
            secondLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            secondLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            secondLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 35)])
        
        NSLayoutConstraint.activate([
            thirdLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            thirdLabel.widthAnchor.constraint(equalToConstant: 350),
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loginButton.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 65)])
        
    }
}
