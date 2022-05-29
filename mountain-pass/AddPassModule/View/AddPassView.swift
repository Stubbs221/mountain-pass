//
//  AddPassView.swift
//  mountain-pass
//
//  Created by Vasily on 21.05.2022.
//

import UIKit

class AddPassView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
        self.setupPassCategoryButtons()
//        self.setNavigationBar()
        
        // Do any additional setup after loading the view.
    }
    
// MARK: Properties
    
    var presenter: AddPassPresenterProtocol!
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: scrollView.contentSize)
        
        
        return contentView
    }()
    
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.frame = contentView.frame
//
//        return stackView
//    }()
    
    lazy var passNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название перевала"
        textField.font = UIFont(name: "PT Sans", size: 18)
        textField.borderStyle = .roundedRect
        
        textField.layer.cornerRadius = 10
//        textField.layer.borderColor = CGColor(red: 115, green: 117, blue: 119, alpha: 0.1)
        textField.layer.borderWidth = 1.0
        
        
//        textField.frame = CGRect(x: 0, y: 0, width: 305, height: 50)
        
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var viewPassCategory: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelPassCategory: UILabel = {
        let label = UILabel()
        label.text = "Категория перевала"
        label.font = UIFont(name: "PT Sans", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "infoIcon"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var stackViewPassCategoryParental: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var stackViewPassCategoryFirstRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 70
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var stackViewPassCategorySecondRow: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var addAdditionalMarksLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить"
        label.font = UIFont(name: "DINPro", size: 15)
        label.textColor = UIColor(named: "BasicDarkGrayColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonStar: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackStarIcon"), for: .normal)
//        button.currentImage?.size = CGSize(width: 10, height: 10)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 11
//                button.layer.borderColor = CGColor()
        button.setTitleColor(UIColor(named: "BasicDarkGrayColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "PT Sans", size: 10)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonNotShure: UIButton = {
        let button = UIButton()
        button.setTitle("Не уверен", for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 11
//                button.layer.borderColor = CGColor()
        button.setTitleColor(UIColor(named: "BasicDarkGrayColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "PT Sans", size: 18)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonRoughly: UIButton = {
        let button = UIButton()
        button.setTitle("Оценочно", for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 11
//                button.layer.borderColor = CGColor()
        button.setTitleColor(UIColor(named: "BasicDarkGrayColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "PT Sans", size: 18)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelStar: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.text = "Сложность существенно \nувеличится в зависимости \nот погодных условий \n(снегопад, внезапное \nоблединение склонов и пр.)"
        label.font = UIFont(name: "PT Sans", size: 11)
        label.textColor = UIColor(named: "BasicDarkGrayColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var labelNotShure: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Если вы не уверены \nв оценке категории"
        label.font = UIFont(name: "PT Sans", size: 11)
        label.textColor = UIColor(named: "BasicDarkGrayColor")
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var labelRoughly: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Если вы не прошли \nэтот перевал"
        label.font = UIFont(name: "PT Sans", size: 11)
        label.textColor = UIColor(named: "BasicDarkGrayColor")
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var labelPassDate: UILabel = {
        let label = UILabel()
        label.text = "Дата прохождения"
        label.font = UIFont(name: "PT Sans", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var viewCalendar: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 11
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonCalendar: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "calendarIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonCurrentDate: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BasicBlueColor")
        button.layer.cornerRadius = 11
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelCoordinates: UILabel = {
        let label = UILabel()
        label.text = "Координаты"
        label.font = UIFont(name: "PT Sans", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewCoordinates: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 11
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonCoordinates: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mapPointIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var viewPassHeight: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 11
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelPassHeight: UILabel = {
        let label = UILabel()
        label.text = "Высота"
        label.textColor = UIColor(named: "BasicGrayColor")
        label.font = UIFont(name: "PT Sans", size: 13)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textFieldPassHeight: UITextField = {
        let textField = UITextField()
        textField.placeholder = "1000"
        textField.font = UIFont(name: "PT Sans", size: 18)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var labelPhoto: UILabel = {
        let label = UILabel()
        label.text = "Фото"
        label.font = UIFont(name: "PT Sans", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelAddPhoto: UILabel = {
        let label = UILabel()
        label.text = "Добавьте фото"
        label.font = UIFont(name: "Montserrat-Light", size: 24)
        label.textColor = UIColor(named: "BasicGrayColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonAddPhotoFromGalery: UIButton = {
        let view = UIButton()
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 11
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageAddPhotoFromGalery: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fromGaleryIcon")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    lazy var labelAddPhotoFromGalery: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Из галереи"
        label.font = UIFont(name: "DINPro", size: 20)
        return label
    }()
//    lazy var viewAddPhotoFromGalery: UIView = {
//        let view = UIView()
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
//    MARK: - Actions
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddPassView: AddPassViewProtocol {
    
}


//     MARK: Setup UI

extension AddPassView {
    private func setupUI(){
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
//        contentView.addSubview(stackView)
        
        contentView.addSubview(passNameTextField)
        contentView.addSubview(viewPassCategory)
        contentView.addSubview(stackViewPassCategoryParental)
        contentView.addSubview(addAdditionalMarksLabel)
        contentView.addSubview(buttonStar)
        contentView.addSubview(buttonNotShure)
        contentView.addSubview(buttonRoughly)
        contentView.addSubview(labelStar)
        contentView.addSubview(labelNotShure)
        contentView.addSubview(labelRoughly)
        contentView.addSubview(labelPassDate)
        contentView.addSubview(viewCalendar)
        contentView.addSubview(buttonCurrentDate)
        contentView.addSubview(labelCoordinates)
        contentView.addSubview(viewCoordinates)
        contentView.addSubview(viewPassHeight)
        contentView.addSubview(labelPhoto)
        contentView.addSubview(labelAddPhoto)
        contentView.addSubview(buttonAddPhotoFromGalery)
        
        
        
        
        NSLayoutConstraint.activate([
            passNameTextField.widthAnchor.constraint(equalToConstant: 340),
            passNameTextField.heightAnchor.constraint(equalToConstant: 60),
            passNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passNameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            viewPassCategory.topAnchor.constraint(equalTo: passNameTextField.bottomAnchor, constant: 20),
            viewPassCategory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            viewPassCategory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            viewPassCategory.heightAnchor.constraint(equalToConstant: 30)])
        
        viewPassCategory.addSubview(labelPassCategory)
        
        NSLayoutConstraint.activate([
            labelPassCategory.centerYAnchor.constraint(equalTo: viewPassCategory.centerYAnchor),
            labelPassCategory.leadingAnchor.constraint(equalTo: viewPassCategory.leadingAnchor)])
        
        viewPassCategory.addSubview(infoButton)
        
        NSLayoutConstraint.activate([
            infoButton.centerYAnchor.constraint(equalTo: viewPassCategory.centerYAnchor),
            infoButton.trailingAnchor.constraint(equalTo: viewPassCategory.trailingAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 20),
            infoButton.widthAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([
            stackViewPassCategoryParental.topAnchor.constraint(equalTo: viewPassCategory.bottomAnchor, constant: 25),
            stackViewPassCategoryParental.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackViewPassCategoryParental.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            stackViewPassCategoryParental.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            stackViewPassCategoryParental.heightAnchor.constraint(equalToConstant: 110)])
        
        stackViewPassCategoryParental.addArrangedSubview(stackViewPassCategoryFirstRow)
        stackViewPassCategoryParental.addArrangedSubview(stackViewPassCategorySecondRow)
        
        NSLayoutConstraint.activate([
            addAdditionalMarksLabel.topAnchor.constraint(equalTo: stackViewPassCategoryParental.bottomAnchor, constant: 25),
            addAdditionalMarksLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)])
        
        NSLayoutConstraint.activate([
            buttonStar.heightAnchor.constraint(equalToConstant: 40),
            buttonStar.widthAnchor.constraint(equalToConstant: 65),
            buttonStar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            buttonStar.topAnchor.constraint(equalTo: addAdditionalMarksLabel.bottomAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            buttonNotShure.heightAnchor.constraint(equalToConstant: 40),
            buttonNotShure.widthAnchor.constraint(equalToConstant: 100),
            buttonNotShure.topAnchor.constraint(equalTo: buttonStar.topAnchor),
            buttonNotShure.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ])
        
        NSLayoutConstraint.activate([
            buttonRoughly.heightAnchor.constraint(equalToConstant: 40),
            buttonRoughly.widthAnchor.constraint(equalToConstant: 100),
            buttonRoughly.topAnchor.constraint(equalTo: buttonStar.topAnchor),
            buttonRoughly.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)])
        
        NSLayoutConstraint.activate([
            labelStar.leadingAnchor.constraint(equalTo: buttonStar.leadingAnchor),
            labelStar.topAnchor.constraint(equalTo: buttonStar.bottomAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            labelNotShure.leadingAnchor.constraint(equalTo: buttonNotShure.leadingAnchor),
            labelNotShure.topAnchor.constraint(equalTo: labelStar.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelRoughly.leadingAnchor.constraint(equalTo: buttonRoughly.leadingAnchor),
            labelRoughly.topAnchor.constraint(equalTo: labelStar.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelPassDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            labelPassDate.topAnchor.constraint(equalTo: labelStar.bottomAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            viewCalendar.widthAnchor.constraint(equalToConstant: 210),
            viewCalendar.heightAnchor.constraint(equalToConstant: 60),
            viewCalendar.leadingAnchor.constraint(equalTo: labelPassDate.leadingAnchor),
            viewCalendar.topAnchor.constraint(equalTo: labelPassDate.bottomAnchor, constant: 15)])
        
        viewCalendar.addSubview(buttonCalendar)
        
        NSLayoutConstraint.activate([
            buttonCalendar.widthAnchor.constraint(equalToConstant: 20),
            buttonCalendar.heightAnchor.constraint(equalToConstant: 20),
            buttonCalendar.centerYAnchor.constraint(equalTo: viewCalendar.centerYAnchor),
            buttonCalendar.leadingAnchor.constraint(equalTo: viewCalendar.leadingAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            buttonCurrentDate.widthAnchor.constraint(equalToConstant: 130),
            buttonCurrentDate.heightAnchor.constraint(equalToConstant: 60),
            buttonCurrentDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            buttonCurrentDate.topAnchor.constraint(equalTo: viewCalendar.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelCoordinates.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            labelCoordinates.topAnchor.constraint(equalTo: viewCalendar.bottomAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            labelCoordinates.widthAnchor.constraint(equalToConstant: 210),
            labelCoordinates.heightAnchor.constraint(equalToConstant: 40),
            labelCoordinates.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            labelCoordinates.topAnchor.constraint(equalTo: labelCoordinates.bottomAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            viewCoordinates.widthAnchor.constraint(equalToConstant: 210),
            viewCoordinates.heightAnchor.constraint(equalToConstant: 60),
            viewCoordinates.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            viewCoordinates.topAnchor.constraint(equalTo: labelCoordinates.bottomAnchor, constant: 15)])
        
        viewCoordinates.addSubview(buttonCoordinates)
        
        NSLayoutConstraint.activate([
            buttonCoordinates.centerYAnchor.constraint(equalTo: viewCoordinates.centerYAnchor),
            buttonCoordinates.leadingAnchor.constraint(equalTo: viewCoordinates.leadingAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            viewPassHeight.widthAnchor.constraint(equalToConstant: 130),
            viewPassHeight.heightAnchor.constraint(equalToConstant: 60),
            viewPassHeight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            viewPassHeight.topAnchor.constraint(equalTo: viewCoordinates.topAnchor)
        ])
        
        viewPassHeight.addSubview(labelPassHeight)
        viewPassHeight.addSubview(textFieldPassHeight)
        
        NSLayoutConstraint.activate([
            labelPassHeight.topAnchor.constraint(equalTo: viewPassHeight.topAnchor, constant: 5),
            labelPassHeight.leadingAnchor.constraint(equalTo: viewPassHeight.leadingAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            textFieldPassHeight.centerYAnchor.constraint(equalTo: viewPassHeight.centerYAnchor),
            textFieldPassHeight.centerXAnchor.constraint(equalTo: viewPassHeight.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            labelPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            labelPhoto.topAnchor.constraint(equalTo: viewPassHeight.bottomAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            labelAddPhoto.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelAddPhoto.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 25)])
        
        NSLayoutConstraint.activate([
            buttonAddPhotoFromGalery.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonAddPhotoFromGalery.topAnchor.constraint(equalTo: labelAddPhoto.bottomAnchor, constant: 20),
            buttonAddPhotoFromGalery.widthAnchor.constraint(equalToConstant: 70),
            buttonAddPhotoFromGalery.heightAnchor.constraint(equalToConstant: 100)])
    }
    
}

// MARK: Setup Pass Category buttons

extension AddPassView {
    private func setupPassCategoryButtons() {
        let passCategoryFirstRow: [String] = ["Н/К","1A","1Б"]
        let passCategorySecondRow: [String] = ["2А","2Б","3А","3Б"]
        
        for item in 0..<passCategoryFirstRow.count {
            let button: UIButton = {
                let button = UIButton()
                button.layer.borderWidth = 1.0
                button.layer.cornerRadius = 11
//                button.layer.borderColor = CGColor()
                button.setTitleColor(UIColor(named: "BasicDarkGrayColor"), for: .normal)
                button.setTitle(passCategoryFirstRow[item], for: .normal)
                button.titleLabel?.font = UIFont(name: "PT Sans", size: 16)
                
                button.translatesAutoresizingMaskIntoConstraints = false
                return button
            }()
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 65),
                button.heightAnchor.constraint(equalToConstant: 40)])
            
            stackViewPassCategoryFirstRow.addArrangedSubview(button)
        }
        
        for item in 0..<passCategorySecondRow.count {
            let button: UIButton = {
                let button = UIButton()
                button.layer.borderWidth = 1.0
                button.layer.cornerRadius = 11
//                button.layer.borderColor = CGColor()
                button.setTitleColor(UIColor(named: "BasicDarkGrayColor"), for: .normal)
                button.setTitle(passCategorySecondRow[item], for: .normal)
                button.titleLabel?.font = UIFont(name: "PT Sans", size: 16)

                button.translatesAutoresizingMaskIntoConstraints = false
                return button
            }()

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 65),
                button.heightAnchor.constraint(equalToConstant: 40)])

            stackViewPassCategorySecondRow.addArrangedSubview(button)
        }
    }
}
