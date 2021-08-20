//
//  HomeView.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation
import UIKit

protocol HomeViewDelegate: class {
    func searchPressed()
    func randomEmojiPressed()
    func emojisListPressed()
    func avatarsListPressed()
    func appleReposPressed()
}

class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "picture")
        
        return imageView
    }()
    
    lazy var randomEmojiButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Random Emoji", for: .normal)
        button.addTarget(self, action: #selector(randomEmojiPressed), for: .touchUpInside)
        button.backgroundColor = .gray
        
        return button
    }()
    
    lazy var emojisListButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Emojis List", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(emojisListPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var avatarsListButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Avatars List", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(avatarsListPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var appleReposButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Apple Repos", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(appleReposPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        
        return stack
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .gray
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.setLeftIcon(UIImage(named: "search") ?? UIImage())
        
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var searchStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.backgroundColor = .blue
        self.searchStackView.addArrangedSubview(searchTextField)
        self.searchStackView.addArrangedSubview(searchButton)
        self.stackView.addArrangedSubview(randomEmojiButton)
        self.stackView.addArrangedSubview(emojisListButton)
        self.stackView.addArrangedSubview(searchStackView)
        self.stackView.addArrangedSubview(avatarsListButton)
        self.stackView.addArrangedSubview(appleReposButton)
        
        self.addSubview(imageView)
        self.addSubview(stackView)
    }
    
    func setConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -24).isActive = true
        
        searchButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    @objc
    func searchPressed(){
        self.delegate?.searchPressed()
    }
    
    @objc
    func randomEmojiPressed(){
        self.delegate?.randomEmojiPressed()
    }
    
    @objc
    func emojisListPressed(){
        self.delegate?.emojisListPressed()
    }
    
    @objc
    func avatarsListPressed(){
        self.delegate?.avatarsListPressed()
    }
    
    @objc
    func appleReposPressed(){
        self.delegate?.appleReposPressed()
    }
    
}
