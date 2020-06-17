//
//  LoginFormController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 16.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signinPressed(_ sender: UIButton) {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        print("login: \(login), password: \(password)")
    }
    
    @IBAction func fogotPasswordPressed(_ sender: UIButton) {
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
    }

    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
       }
    
    @IBAction func scrollTaped(_ gesture: UIGestureRecognizer) {
        scrollView.endEditing(true)
    }

}

