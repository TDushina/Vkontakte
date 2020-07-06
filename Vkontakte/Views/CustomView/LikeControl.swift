//
//  LikeControl.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 04.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

@IBDesignable
class LikeControl: UIControl {
    
    @IBInspectable lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @IBInspectable lazy var likeCountLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(likesCount)"
        label.font = label.font.withSize(12)
        label.textColor = .gray
        return label
    }()
    
    @IBInspectable var likesCount: Int = 3210 {
        didSet {
            likeCountLable.text = "\(likesCount)"
        }
    }
    
    @IBInspectable var isLiked: Bool = false {
        didSet {
            updateLike()
        }
    }
    
    @IBInspectable lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super .init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super .init(coder: coder)
        setup()
    }
    
    // MARK: - Constraints
    private func setup() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        ])
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(likeCountLable)
    }
    
    // MARK: - Actions
    @objc func likeButtonTapped(_ sender: UIButton) {
        isLiked.toggle()
    }
    
    private func updateLike() {
        let imageName = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageName), for: .normal)
        likeButton.tintColor = .red
        likeCountLable.textColor = .red
        if isLiked == true {
            likesCount += 1
        } else {
            likesCount -= 1
            likeButton.tintColor = .gray
            likeCountLable.textColor = .gray
        }
    }
}
