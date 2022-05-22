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
        view.backgroundColor = .white
        setupUI()
//        self.view.backgroundColor = .systemCyan
        // Do any additional setup after loading the view.
    }
    
//    MARK: - Properties
    
    var presenter: ProfilePresenterProtocol!

    lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profileViewBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    lazy var pressPlusLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите на +\nчтобы добавить перевал"
        label.numberOfLines = 2
        label.font = UIFont(name: "PT Sans", size: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var linkButton: UIButton = {
        let button = UIButton()
        button.setTitle("Посмотреть базу перевалов", for: .normal)

        button.setTitleColor(UIColor(named: "BasicBlueColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "DINPro", size: 20)
        button.addTarget(self, action: #selector(linkButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//    MARK: - Actions
    
    @objc func linkButtonPressed() {
        UIApplication.shared.open((URL(string: "https://tssr.ru/pereval")!), options: [:], completionHandler: nil)
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

// MARK: Conforming to 'ProfileViewProtocol'

extension ProfileView: ProfileViewProtocol {
    
}

// MARK: Setup UI
extension ProfileView {
    func setupUI() {
    
        self.view.addSubview(backgroundImage)
        self.view.addSubview(pressPlusLabel)
        self.view.addSubview(linkButton)
        
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backgroundImage.heightAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier:( (backgroundImage.image?.size.height)! / (backgroundImage.image?.size.width)!)) ])
        
        NSLayoutConstraint.activate([
            pressPlusLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pressPlusLabel.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 40),
            pressPlusLabel.widthAnchor.constraint(equalToConstant: 300)])
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.topAnchor.constraint(equalTo: pressPlusLabel.bottomAnchor, constant: 46),
            linkButton.widthAnchor.constraint(equalToConstant: 280)])
            
    }
}
