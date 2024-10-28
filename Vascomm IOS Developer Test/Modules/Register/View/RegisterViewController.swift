//
//  RegisterViewController.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import UIKit

protocol RegisterViewInterface {
    
}

class RegisterViewController: UIViewController, RegisterViewInterface {
    
    var registerPresenter: RegisterPresenterInterface?
    
    // UI Elements
    // MARK: UI Elemen dari login, harusnya dibuat reusable aja tapi kelupaan pas diawal.
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(hex: "#1D334F")
        
        let titleString = "Hai, Selamat Datang"
        
        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 28, weight: .regular)
        ]
        
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
        let attributedString = NSMutableAttributedString(string: titleString)
        
        let boldRange = (titleString as NSString).range(of: "Selamat Datang")
        
        attributedString.addAttributes(regularAttributes, range: NSRange(location: 0, length: titleString.count))
        
        attributedString.addAttributes(boldAttributes, range: boldRange)
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textColor = UIColor(hex: "#597393")
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        
        let subtitleString = "Silahkan login untuk melanjutkan"
        
        label.text = subtitleString
        
        return label
    }()
    
    private let loginGraphicImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "loginGraphic"))
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    // MARK: Register UI Element
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Nama Depan"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan nama depan anda"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private lazy var firstNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Nama Belakang"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan nama belakang anda"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private lazy var lastNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastNameLabel, lastNameTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameStackView, lastNameStackView])
        
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let idCardLabel: UILabel = {
        let label = UILabel()
        
        label.text = "No. KTP"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let idCardTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan No. KTP anda"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private lazy var idCardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idCardLabel, idCardTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Email"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan email anda"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        
        label.text = "No. Telpon"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan No. Telpon anda"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private lazy var phoneStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneLabel, phoneTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Password"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan password anda"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let passwordConfirmLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Konfirmasi Password"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let passwordConfirmTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Konfirmasi password anda"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var passwordConfirmStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordConfirmLabel, passwordConfirmTextField])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#002060")
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var registerFormStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView, idCardStackView, emailStackView, phoneStackView, passwordStackView, passwordConfirmStackView, registerButton])
        
        stackView.axis = .vertical
        stackView.spacing = 40
        
        return stackView
    }()
    
    private let loginLabel1: UILabel = {
        let label = UILabel()
        
        label.text = "Sudah punya akun ?"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#BEBEBE")
        label.textAlignment = .center
        
        return label
    }()
    
//    private let loginLabel2: UILabel = {
//        let label = UILabel()
//        
//        label.text = "Login sekarang"
//        label.font = .systemFont(ofSize: 14)
//        label.textColor = UIColor(hex: "#002060")
//        label.textAlignment = .center
//        
//        return label
//    }()
    
    private lazy var loginLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginLabel1])
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private let copyrightLabel: UILabel = {
        let label = UILabel()
        
        label.text = "© SILK. All Rights Reserved"
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(hex: "#BEBEBE")
        label.textAlignment = .center
        
        return label
    }()
    
    private let registerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func setupLayout() {
        
        // ScrollView
        view.addSubview(registerScrollView)
        registerScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            registerScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            registerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Title Label
        registerScrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: registerScrollView.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Sub-title Label
        registerScrollView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Login Graphic / Image
        registerScrollView.addSubview(loginGraphicImageView)
        loginGraphicImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginGraphicImageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: -11),
            loginGraphicImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginGraphicImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100),
            loginGraphicImageView.heightAnchor.constraint(equalToConstant: 218)
        ])
        
        // Register Form
        registerScrollView.addSubview(registerFormStackView)
        registerFormStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerFormStackView.topAnchor.constraint(equalTo: loginGraphicImageView.bottomAnchor, constant: 30),
            registerFormStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerFormStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Login Label & Button
        let loginLabelButton = ClickableLabel()
        loginLabelButton.text = "Login sekarang"
        loginLabelButton.font = .systemFont(ofSize: 14)
        loginLabelButton.textColor = UIColor(hex: "#002060")
        loginLabelButton.textAlignment = .center
        loginLabelButton.tapAction = {
            self.labelTapped()
        }
        
        registerScrollView.addSubview(loginLabelStackView)
        loginLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        loginLabelStackView.addArrangedSubview(loginLabelButton)
        loginLabelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginLabelStackView.topAnchor.constraint(equalTo: registerFormStackView.bottomAnchor, constant: 30),
            loginLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            loginLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
    
        // Copyright Label
        registerScrollView.addSubview(copyrightLabel)
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            copyrightLabel.topAnchor.constraint(equalTo: loginLabelStackView.bottomAnchor, constant: 40),
            copyrightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            copyrightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            copyrightLabel.bottomAnchor.constraint(equalTo: registerScrollView.bottomAnchor)
        ])
    }
    
    func labelTapped() {
        print("labelTapped")
        registerPresenter?.didTapLoginButton()
    }
}
