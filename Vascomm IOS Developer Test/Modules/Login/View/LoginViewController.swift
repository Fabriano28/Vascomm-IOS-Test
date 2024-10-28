//
//  LoginViewController.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import UIKit

protocol LoginViewInterface: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
    func navigateToHome()
}

class LoginViewController: UIViewController, LoginViewInterface {
    
    var presenter: LoginPresenterInterface?
    var router: LoginRouterInterface?
    
    // UI Elements
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
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 16)
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
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Lupa Password anda?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#597393")
        
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan password anda"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var passwordLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordLabel, forgotPasswordLabel])
        
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordLabelStackView, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#002060")
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var loginFormStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ emailStackView, passwordStackView, loginButton])
        
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let registerLabel1: UILabel = {
        let label = UILabel()
        
        label.text = "Belum punya akun ?"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#BEBEBE")
        label.textAlignment = .center
        
        return label
    }()
    
    private let registerLabel2: UILabel = {
        let label = UILabel()
        
        label.text = "Daftar sekarang"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#002060")
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var registerLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerLabel1])
        
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupKeyboardObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        if let activeField = view.firstResponder as? UITextField {
            let fieldFrame = activeField.superview?.convert(activeField.frame, to: view) ?? .zero
            
            let offset = fieldFrame.maxY - (view.frame.height - keyboardHeight)
            
            if offset > 0 {
                self.view.frame.origin.y = -offset - 100
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
    
    func showError(_ message: String) {
    }
    
    func navigateToHome() {
//        router?.navigateToHome(from: view)
    }
    
    @objc func handleLoginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        print("tapped")
        
        presenter?.login(with: email, password: password)
    }
    
    // UI Functions
    private func setupLayout() {
        
        // Title Label
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Sub-title Label
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Login Graphic / Image
        view.addSubview(loginGraphicImageView)
        loginGraphicImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginGraphicImageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: -11),
            loginGraphicImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginGraphicImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100),
            loginGraphicImageView.heightAnchor.constraint(equalToConstant: 218)
        ])
        
        // Form
        view.addSubview(loginFormStackView)
        loginFormStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginFormStackView.topAnchor.constraint(equalTo: loginGraphicImageView.bottomAnchor, constant: 30),
            loginFormStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginFormStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Register Label & Button
        let registerLabelButton = ClickableLabel()
        registerLabelButton.text = "Daftar sekarang"
        registerLabelButton.font = .systemFont(ofSize: 14)
        registerLabelButton.textColor = UIColor(hex: "#002060")
        registerLabelButton.textAlignment = .center
        registerLabelButton.tapAction = {
            self.labelTapped()
        }
        
        view.addSubview(registerLabelStackView)
        registerLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        registerLabelStackView.addArrangedSubview(registerLabelButton)
        registerLabelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabelStackView.topAnchor.constraint(equalTo: loginFormStackView.bottomAnchor, constant: 30),
            registerLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            registerLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
        // Copyright Label
        view.addSubview(copyrightLabel)
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            copyrightLabel.topAnchor.constraint(equalTo: registerLabelStackView.bottomAnchor, constant: 40),
            copyrightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            copyrightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        loginButton.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
        
    }
    
    private func labelTapped() {
        print("Navigating")
        presenter?.didTapRegisterButton()
    }

}
