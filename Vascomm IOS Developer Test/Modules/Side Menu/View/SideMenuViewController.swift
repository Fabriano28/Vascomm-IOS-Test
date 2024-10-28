//
//  SideMenuViewController.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    private let sideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#002060")?.withAlphaComponent(0.5)
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor( .black, for: .normal)
        button.tintColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.contentMode = .scaleAspectFill
        imageView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Farrel Brian"
        label.textColor = UIColor(hex: "#002060")
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private let membershipLabel: UILabel = {
        let label = UILabel()
        label.text = "Membership BBLK"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, membershipLabel])
        stackView.axis = .vertical
        stackView.spacing = 1
        return stackView
    }()
    
    private lazy var profileDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, labelStackView])
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Profile Saya", for: .normal)
        button.setTitleColor(UIColor(hex: "#9A9A9A"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.backgroundColor = .clear
        button.layer.borderWidth = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Pengaturan", for: .normal)
        button.setTitleColor(UIColor(hex: "#9A9A9A"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.backgroundColor = .clear
        button.layer.borderWidth = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .red
        
        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        button.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        return button
    }()
    
    private let socialLabel: UILabel = {
        let label = UILabel()
        label.text = "Ikuti kami di Sosial Media"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hex: "#002060")
        return label
    }()

    private lazy var optionsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileDataStackView, profileButton, settingsButton, logoutButton, socialLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let rightView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var sideMenuStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sideView, rightView])
        
        stackView.axis = .horizontal
//        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(sideMenuStackView)
        sideMenuStackView.backgroundColor = .white
        
        rightView.addSubview(optionsStackView)
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sideMenuStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sideMenuStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sideMenuStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sideMenuStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sideView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            optionsStackView.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            optionsStackView.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            logoutButton.widthAnchor.constraint(equalToConstant: 120),
        ])
        
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        sideView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.layer.cornerRadius = 20
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: sideView.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func profileButtonTapped() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
        closeButtonTapped()
    }
    
    @objc func logoutButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
        closeButtonTapped()
    }
}
