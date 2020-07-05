//
//  AvatarView.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 04.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

@IBDesignable class AvatarView: UIView {
    
    @IBInspectable var shadowRadius: CGFloat = 1 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var shadowOffSet: CGSize = .zero {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var avatarImage: UIImage? = nil {
        didSet {
            imageView.image = avatarImage
            setNeedsDisplay()
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.backgroundColor = .gray
        return view
    }()

    public override init(frame: CGRect) {
        super .init(frame: frame)
        print(#function)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super .init(coder: coder)
        print(#function)
        setup()
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.layer.cornerRadius = shadowView.frame.width / 2
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
    
    // MARK: - Constraints
    private func setup() {
        addSubview(shadowView)
        addSubview(imageView)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            shadowView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            shadowView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        ])
    }
    
    private func updateShadow() {
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity / 10
        shadowView.layer.shadowOffset = shadowOffSet
    }
}
