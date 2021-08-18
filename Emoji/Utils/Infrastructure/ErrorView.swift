//
//  ErrorView.swift
//  Emoji
//
//  Created by Any Ambria on 16/08/21.
//

import UIKit

class ErrorView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "error")
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Error"
        label.textColor = .white
        
        return label
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
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
    
    func setConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 24).isActive = true
    }
}
