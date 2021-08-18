//
//  EmojisViewCell.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import UIKit

class EmojisViewCell: UICollectionViewCell {
    
    static let reuseId = "EmojisViewCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
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
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .blue
        
        self.contentView.addSubview(imageView)
    }
    
    func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
}
