//
//  ViewController.swift
//  lesson-autolayout
//
//  Created by Viacheslav Troian on 2/11/18.
//  Copyright © 2018 Viacheslav Troian. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var mainPinkAlpha = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 0.5)
}

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)
        ])
        attributedText.append(NSMutableAttributedString(
            string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
            attributes:[
                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
                NSAttributedStringKey.foregroundColor: UIColor.gray
            ])
        )
        textView.attributedText = attributedText
        
//        textView.text = "Join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        
        return textView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        
        return button
    }()
    
    let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .mainPinkAlpha
        
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomControls()
    }
    
    private func setupBottomControls() {
        let stackView = UIStackView()
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(nextButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
//        topImageContainerView.backgroundColor = .blue
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topImageContainerView)
        
        
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true // set leadingAnchor insthead to set leftAnchor
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        
        //        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //        imageView.frame.origin.x = 20
        
//        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(lessThanOrEqualTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true

    }
}

