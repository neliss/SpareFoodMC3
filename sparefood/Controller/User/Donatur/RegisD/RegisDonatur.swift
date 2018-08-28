//
//  RegisDonatur.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class RegisDonatur: UIViewController,UINavigationControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate {
    
    @IBOutlet weak var phonenumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var confirmpasswordField: UITextField!

    var activityView:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        //view.addSubview(continueButton)
        setContinueButton(enabled: false)
        activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        //activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        view.addSubview(activityView)
        
        phonenumberField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        confirmpasswordField.delegate = self
        
        phonenumberField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        confirmpasswordField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //emailField.becomeFirstResponder()
        //        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        phonenumberField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @IBAction func signupHandler(_ sender: Any) {
        handleSignUp()
    }
    
    
    
    @objc func textFieldChanged(_ target:UITextField) {
        let phonenumber = phonenumberField.text
        let email = emailField.text
        let password = passwordField.text
        let confirmpassword = confirmpasswordField.text
        let formFilled = phonenumber != nil && phonenumber != "" && email != nil && email != "" && password != nil && password != "" && confirmpassword != nil && confirmpassword != "" && confirmpassword == password
        setContinueButton(enabled: formFilled)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Resigns the target textField and assigns the next textField in the form.
        
        switch textField {
        case phonenumberField:
            phonenumberField.resignFirstResponder()
            emailField.becomeFirstResponder()
            break
        case emailField:
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
            break
        case passwordField:
            handleSignUp()
            break
        default:
            break
        }
        return true
    }
    
    /**
     Enables or Disables the **continueButton**.
     */
    
    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        guard let phonenumber = phonenumberField.text else { return }
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        setContinueButton(enabled: false)
        //continueButton.setTitle("", for: .normal)
        activityView.startAnimating()
        //
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in if error == nil && user != nil {
            print("User Created!")
            self.performSegue(withIdentifier: "signupDtoLogin", sender: self)
            
            //            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            //changeRequest?.displayName = username
            //changeRequest?.commitChanges { error in if error == nil {
            //print("User display name changed!")
            //                self.dismiss(animated: false, completion: nil)
            //                }
            
            //            }
            
        }else{
            print("Error creating user: \(error!.localizedDescription)")
            }
            
        }
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
        
    }

}
