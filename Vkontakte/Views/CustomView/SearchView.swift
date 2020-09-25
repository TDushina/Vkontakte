//
//  SearchView.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 11.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class SearchView: UIView, UITextFieldDelegate {
    
    weak var delegate: UITextFieldDelegate?
    
    var color: UIColor = .systemGray
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = color
        textField.attributedPlaceholder = NSAttributedString(
            string: "Поиск",
            attributes: [NSAttributedString.Key.foregroundColor: color])
        textField.borderStyle = .none
        textField.delegate = self
        return textField
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var searchIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "magnifyingglass")
        icon.tintColor = color
        return icon
    }()
    
    var iconCenterXConstraint: NSLayoutConstraint!
    var textFieldLeftConsntraint: NSLayoutConstraint!
    var cancelButtonLeftConsntraint: NSLayoutConstraint!

    override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         setup()
     }
    
    private func setup() {
        backgroundColor = .systemGray5
        
        addSubview(textField)
        addSubview(cancelButton)
        addSubview(searchIcon)
        
        iconCenterXConstraint = searchIcon.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        textFieldLeftConsntraint = textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        cancelButtonLeftConsntraint = cancelButton.leftAnchor.constraint(equalTo: rightAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            textFieldLeftConsntraint,
            textField.rightAnchor.constraint(equalTo: cancelButton.leftAnchor, constant: 0),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            cancelButton.widthAnchor.constraint(equalToConstant: 90),
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            cancelButtonLeftConsntraint,
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            iconCenterXConstraint
        ])
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textFieldLeftConsntraint.constant = searchIcon.bounds.width + 15
        cancelButtonLeftConsntraint.constant = -90
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
        
        iconCenterXConstraint.constant = -(bounds.width / 2 - 20)
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 3,
            animations: {
                self.layoutIfNeeded()
            })
        return true
    }
    
    @objc func cancelTapped() {
        textField.resignFirstResponder()
        textField.text = ""
        textFieldLeftConsntraint.constant = 10
        iconCenterXConstraint.constant = 0
        cancelButtonLeftConsntraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
    }

}
