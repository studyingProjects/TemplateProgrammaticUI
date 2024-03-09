//
//  FirstViewController.swift
//  TemplateProgrammaticUI
//
//  Created by Andrei Shpartou on 08/03/2024.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    private var contentView: UIView = UIView()
    private var backGroundImage: UIImageView = UIImageView()
    private var fbButton: UIButton = UIButton()
    private var gmailButton: UIButton = UIButton()
    private var emailButton: UIButton = UIButton()
    private var titleLabel: UILabel = UILabel()
    private var hintLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        setupActions()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        fbButton.layer.cornerRadius = fbButton.frame.height / 2
        gmailButton.layer.cornerRadius = gmailButton.frame.height / 2
        emailButton.layer.cornerRadius = emailButton.frame.height / 2
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = UIBezierPath(roundedRect: fbButton.bounds, cornerRadius: fbButton.layer.cornerRadius).cgPath
        shadowLayer.shadowOffset = CGSize(width: 5.0, height: 10.0)
        shadowLayer.shadowOpacity = 0.7
        shadowLayer.shadowRadius = 10
        
        fbButton.layer.insertSublayer(shadowLayer, at: 0)
        gmailButton.layer.insertSublayer(shadowLayer, at: 0)
        emailButton.layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
    
    private func setupView() {
        self.view.addSubview(contentView)
        //self.view.backgroundColor = .blue

        contentView.addSubview(backGroundImage)
        contentView.addSubview(fbButton)
        contentView.addSubview(gmailButton)
        contentView.addSubview(emailButton)
        contentView.addSubview(hintLabel)
        contentView.addSubview(titleLabel)
    }
    // MARK: - Setup View
    private func setupConstraints() {
        setupContentView()
        setupBackGroundImage()
        setupFbButton()
        setupGmailButton()
        setupEmailButton()
        setupHintLabel()
        setupTitleLabel()
                
        view.layoutIfNeeded()
    }
    
    private func setupContentView() {
        // Content view, first way to add constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setupBackGroundImage() {
        backGroundImage.image = UIImage(named: "Background")
        
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backGroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backGroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    // MARK: - Buttons
    private func setupFbButton() {
        fbButton.setBackgroundImage(UIImage(named: "FB"), for: .normal)
        fbButton.setTitle("Sign in with Facebook", for: .normal)
        fbButton.setTitleColor(.black, for: .normal)
        
        fbButton.layer.masksToBounds = true
        //fbButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        fbButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fbButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            fbButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            fbButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            fbButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupGmailButton() {
        gmailButton.setBackgroundImage(UIImage(named: "Google"), for: .normal)
        gmailButton.setTitle("Sign in with Google", for: .normal)
        gmailButton.setTitleColor(.black, for: .normal)
        
        gmailButton.layer.masksToBounds = true
        
        gmailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gmailButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            gmailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            gmailButton.topAnchor.constraint(equalTo: fbButton.bottomAnchor, constant: 20),
            gmailButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupEmailButton() {
        emailButton.setBackgroundImage(UIImage(named: "Email"), for: .normal)
        emailButton.setTitle("Sign in with Email", for: .normal)
        emailButton.setTitleColor(.black, for: .normal)
        
        //emailButton.layer.masksToBounds = true
        
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            emailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            emailButton.topAnchor.constraint(equalTo: gmailButton.bottomAnchor, constant: 20),
            emailButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupHintLabel() {
        hintLabel.text = "Login or create an account"
        
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hintLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hintLabel.bottomAnchor.constraint(equalTo: fbButton.topAnchor, constant: -20)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Social \nSquid"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-Regular", size: 44)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: hintLabel.topAnchor, constant: -50)
        ])
    }
    
    private func setupActions() {
        fbButton.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        gmailButton.addTarget(self, action: #selector(gmailButtonPressed), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(emailButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Action methods
    @objc func fbButtonPressed() {
        let newViewController = SecondViewController()
        newViewController.title = "Facebook screen"
        // first way
//        newViewController.modalPresentationStyle = .fullScreen
//        self.present(newViewController, animated: true)
        
        // second way
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func gmailButtonPressed() {
        print("gmailButtonPressed")
    }
    
    @objc func emailButtonPressed() {
        print("emailButtonPressed")
    }
    

}
