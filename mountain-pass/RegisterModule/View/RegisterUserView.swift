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
        view.backgroundColor = .white
        
        setupUI()
        setupTextFields()
//        self.title = "Добро пожаловать"
        // Do any additional setup after loading the view.
    }
    
// MARK: - Properties
    
    var presenter: RegisterUserPresenterProtocol!
    
    var firstName: String = ""
    var middleName: String = ""
    var lastName: String = ""
    var email: String = ""
    var phoneNumber: String = ""
    var socialNetwork: String = ""
    
    private var currentTextField: UITextField?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)

        return contentView
    }()
    
    
    
    
    lazy var labelView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var labelFirst: UILabel = {
        let label = UILabel()
        label.text = "Давайте знакомиться"
        label.font = UIFont(name: "PT Sans", size: 33)
        label.textColor = UIColor(named: "BasicBlueColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelSecond: UILabel = {
        let label = UILabel()
        label.text = "Запишем вас: \n • в список помогавших \n   наполнять базу перевалов \n • в качестве первопроходителей    \n   перевала, если он новый \n • в базу туристов ФСТР"
        label.numberOfLines = 6
        label.textColor = UIColor(named: "BasicDarkGrayColor")
        label.font = UIFont(name: "Montserrat-Light", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var registerUserButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BasicSemiOpaqueBlue")
        button.setTitleColor(UIColor(named: "BasicSemiOpaqueColor"), for: .normal)
        button.setTitle("ВОЙТИ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Light", size: 20)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(registerUserPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tabBar: UITabBarController = {
        let tabBar = UITabBarController()
        
        return tabBar
    }()
    
//    MARK: - Actions
    
    @objc func registerUserPressed() {
        if let currentTextField = currentTextField {
            currentTextField.resignFirstResponder()
        }
        
        presenter.registerUserBtnPressed(firstName: firstName, middleName: middleName, lastName: lastName, email: email, phoneNumber: phoneNumber, socialNetworkURL: socialNetwork)
        
        print("View receives: \(firstName),\(middleName),\(lastName),\(email),\(phoneNumber),\(socialNetwork)")
        let profileVC = ProfileTabBarController()
        
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
        
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

// MARK: - Conforming 'RegisterUserPresenterProtocol'

extension RegisterUserView: RegisterUserViewProtocol {
    func onUserRegisterSuccess(message: String) {
        print("User successfuly added to Realm Data Base")
    }
    
    func onUserRegisterFailure(message: String) {
        let alert = UIAlertController(title: "Ошибка записи", message: "перезапустите приложение и попробуйте снова", preferredStyle: .alert)

        let okButton = UIAlertAction(title: "Принять", style: .cancel, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}

// MARK: - Setup UI

extension RegisterUserView {
    private func setupUI() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(labelView)
        contentView.addSubview(labelFirst)
        contentView.addSubview(labelSecond)
        contentView.addSubview(registerUserButton)
        
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
        NSLayoutConstraint.activate([
            registerUserButton.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: 400),
            registerUserButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            registerUserButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            registerUserButton.heightAnchor.constraint(equalToConstant: 55)])
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            labelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            labelView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        NSLayoutConstraint.activate([
            labelFirst.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 20),
            labelFirst.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            labelFirst.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            labelFirst.heightAnchor.constraint(equalToConstant: 35),
            
            ])
        
        NSLayoutConstraint.activate([
            labelSecond.topAnchor.constraint(equalTo: labelFirst.bottomAnchor, constant: 5),
            labelSecond.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            labelSecond.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            labelSecond.heightAnchor.constraint(equalToConstant: 146)
        ])
    }
}

// MARK: - Setup TextFields

extension RegisterUserView {
    private func setupTextFields() {
        
        let placeholdersForTextFields: [String] = [ "Иванов", "Иван", "Иванович", "yourname@mail.ru", "+7_", "ссылка на соцсети"]
        let descriptionsForTextFields: [String] = [ "Фамилия", "Имя", "Отчество", "E-mail будет логином и основным средством связи с вами", "По желанию", "По желанию" ]
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 7
            stackView.alignment = .center
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        
        for item in 0..<placeholdersForTextFields.count {
            let viewForTextField: UIView = {
                let viewForTextField = UIView()
                viewForTextField.translatesAutoresizingMaskIntoConstraints = false
                return viewForTextField
            }()
            
            let textField: UITextField = {
                let textField = UITextField()
                textField.placeholder = placeholdersForTextFields[item]
                textField.font = UIFont(name: "Montserrat-Light", size: 13)
                textField.keyboardType = .default
                textField.keyboardAppearance = .default
                textField.borderStyle = .roundedRect
                textField.tag = item
                textField.delegate = self
                if item == 4 {
                    textField.keyboardType = .emailAddress
                }
                textField.translatesAutoresizingMaskIntoConstraints = false
                return textField
            }()
            
            let label: UILabel = {
                let label = UILabel()
                label.text = descriptionsForTextFields[item]
                label.font = UIFont(name: "PT Sans", size: 9)
                label.textColor = UIColor(named: "BasicGrayColor")
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            viewForTextField.addSubview(textField)
            viewForTextField.addSubview(label)
            
            NSLayoutConstraint.activate([
                textField.widthAnchor.constraint(equalTo: viewForTextField.widthAnchor),
                textField.heightAnchor.constraint(equalToConstant: 30),
                label.heightAnchor.constraint(equalToConstant: 10),
                label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 7),
                label.bottomAnchor.constraint(equalTo: viewForTextField.bottomAnchor, constant: -7),
                label.widthAnchor.constraint(equalTo: viewForTextField.widthAnchor)
            ])
            
            stackView.addArrangedSubview(viewForTextField)
            
            
        }
        
        for viewTextField in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                viewTextField.widthAnchor.constraint(equalToConstant: 300),
                viewTextField.heightAnchor.constraint(equalToConstant: 54)
            ])
        }
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: 20)]
            )
    }
}
// MARK: - UITextField Delegate

extension RegisterUserView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField.tag {
        case 0:
            firstName = textField.text ?? ""
        case 1:
            middleName = textField.text ?? ""
        case 2:
            print("получен текст \(textField.text!)")
            lastName = textField.text ?? ""
        case 3:
            email = textField.text ?? ""
        case 4:
            phoneNumber = textField.text ?? ""
        case 5:
            print("получен текст \(textField.text!)")
            socialNetwork = textField.text ?? ""
        default:
            return
            
        }
    }
    
    
}
