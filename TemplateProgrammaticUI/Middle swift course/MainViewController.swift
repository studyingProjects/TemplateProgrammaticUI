//
//  MainViewController.swift
//  TemplateProgrammaticUI
//
//  Created by Andrei Shpartou on 09/03/2024.
//

import UIKit
import SnapKit
import PinLayout

class MainViewController: UIViewController {
    // MARK: - Properties
    // TODO: Create separate methods for properties with attributes setting
    private lazy var contentView: UIView = UIView()
    private lazy var backGroundImage: UIImageView = getBackGroundImage()
    private lazy var fbButton: UIButton = getFbButton()
    private lazy var gmailButton: UIButton = getGmailButton()
    private lazy var emailButton: UIButton = getEmailButton()
    private lazy var titleLabel: UILabel = getTitleLabel()
    private lazy var hintLabel: UILabel = getHintLabel()
    // stack layout example
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = Sizes.Padding.half
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return stackView
//    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupLayers()
    }
    // MARK: - Setup View
    private func setupView() {
//        self.view.backgroundColor = .blue
//        self.title
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(contentView)
        // for stack example
        //contentView.addSubview(stackView)
        //stackView.addArrangedSubview(fbButton)
        //stackView.addArrangedSubview(gmailButton)
        // for stack example
        contentView.addSubview(backGroundImage)
        contentView.addSubview(fbButton)
        contentView.addSubview(gmailButton)
        contentView.addSubview(emailButton)
        contentView.addSubview(hintLabel)
        contentView.addSubview(titleLabel)
        
        setupConstraints()
        view.layoutIfNeeded()
    }

    private func getBackGroundImage() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "Background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    // MARK: - Buttons
    private func getFbButton() -> UIButton {
        
        let button = UIButton()
        // Try to use UIButton.Configuration when we don't need to use
        // backgroundImage
//        var fbConfiguration = UIButton.Configuration.filled()
//        fbConfiguration.cornerStyle = .medium
//        fbConfiguration.buttonSize = .large
//        fbConfiguration.title = "Sign in with Facebook"
//        fbConfiguration.attributedTitle?.foregroundColor = UIColor.black
//        fbButton.configuration = fbConfiguration
        button.setBackgroundImage(UIImage(named: "FB"), for: .normal)
        button.setTitle("Sign in with Facebook", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        
        button.layer.masksToBounds = true
        //fbButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func getGmailButton() -> UIButton {
        let gmailButton = UIButton()
        
        gmailButton.setBackgroundImage(UIImage(named: "Google"), for: .normal)
        gmailButton.setTitle("Sign in with Google", for: .normal)
        gmailButton.setTitleColor(.black, for: .normal)
        gmailButton.addTarget(self, action: #selector(gmailButtonPressed), for: .touchUpInside)
        
        gmailButton.layer.masksToBounds = true
        
        gmailButton.translatesAutoresizingMaskIntoConstraints = false
        
        return gmailButton

    }
    
    private func getEmailButton() -> UIButton {
        let emailButton = UIButton()
        emailButton.setBackgroundImage(UIImage(named: "Email"), for: .normal)
        emailButton.setTitle("Sign in with Email", for: .normal)
        emailButton.setTitleColor(.black, for: .normal)
        emailButton.addTarget(self, action: #selector(emailButtonPressed), for: .touchUpInside)
        
        //emailButton.layer.masksToBounds = true
        
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        return emailButton
    }
    // MARK: - Labels
    private func getTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = "Social \nSquid"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-Regular", size: 44)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }
    
    private func getHintLabel() -> UILabel {
        let hintLabel = UILabel()
        hintLabel.text = "Login or create an account"
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return hintLabel
    }
    // MARK: - Setup layer
    private func setupLayers() {
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

// MARK: - Setup constratints
private extension MainViewController {
    func setupConstraints() {
        // If we have a lot of code into this method we can create several seperate method for each UIElement
        //        setupContentView()
        //        setupBackGroundImage()
        //        setupFbButton()
        //        setupGmailButton()
        //        setupEmailButton()
        //        setupHintLabel()
        //        setupTitleLabel()
        // or create all constraints inside one method
        // also we can create private extension with setupConstraint func for convinience
        
        // Content view, first way to add constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // MARK: - Anchors
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // MARK: - NSLayoutConstraints
        // second way
        NSLayoutConstraint(
            item: contentView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant:  0).isActive = true
        // MARK: - Anchors
        // Background image / one more way to add constraints through an array
        NSLayoutConstraint.activate([
            backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // FaceBook button
        NSLayoutConstraint.activate([
            fbButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.Padding.double),
            fbButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.Padding.double),
            fbButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            fbButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        // MARK: - PinLayout
        // Gmail button
        //gmailButton.pin.left().right().margin(Sizes.Padding.double)
        // https://github.com/layoutBox/PinLayout?tab=readme-ov-file#intro_usage_examples
        NSLayoutConstraint.activate([
            gmailButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.Padding.double),
            gmailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.Padding.double),
            gmailButton.topAnchor.constraint(equalTo: fbButton.bottomAnchor, constant: Sizes.Padding.usual),
            gmailButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        // Email button
//        NSLayoutConstraint.activate([
//            emailButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.Padding.double),
//            emailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.Padding.double),
//            emailButton.topAnchor.constraint(equalTo: gmailButton.bottomAnchor, constant: Sizes.Padding.usual),
//            emailButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//        ])
        // MARK: - SnapKit
        // Email button SnapKit
        emailButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Sizes.Padding.double)
            make.trailing.equalToSuperview().offset(-Sizes.Padding.double)
            make.top.equalTo(gmailButton.snp.bottom).offset(Sizes.Padding.usual)
            make.centerX.equalToSuperview()
        }
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: hintLabel.topAnchor, constant: -Sizes.Padding.double)
        ])
        
        NSLayoutConstraint.activate([
            hintLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hintLabel.bottomAnchor.constraint(equalTo: fbButton.topAnchor, constant: -Sizes.Padding.usual)
        ])
        
    }
    
    // MARK: - VFL
    func layoutThroughTheVisualFormatLanguage() {
        // with special string
        // not popular and old type of layout
        let views: [String: Any] = ["button": fbButton]
        
        let constraint1 = NSLayoutConstraint.constraints(
            withVisualFormat: "|[button(200)]|",
            metrics: nil,
            views: views)
        
        view.addConstraints(constraint1)
    }
}

import SwiftUI
struct MainViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            // change to your vc
            MainViewController().preview()
        }
    }
}
