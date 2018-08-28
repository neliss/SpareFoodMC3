//
//  ProfileViewController.swift
//  sparefood
//
//  Created by Rizki Adrian Saputra on 26/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class ProfileViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
     @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    var activityView:UIActivityIndicatorView!
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContinueButton(enabled: false)
        activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        usernameField.delegate = self
        emailField.delegate = self
        addressField.delegate = self
        
        usernameField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        addressField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        emailField.text = Auth.auth().currentUser?.email
        usernameField.text = Auth.auth().currentUser?.displayName
//        profileImageView = Auth.auth().currentUser?.photoURL.
        //addressField.text = Auth.auth().currentUser
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
        //tapToChangeProfileButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signoutHandler(_ sender: Any) {
        try! Auth.auth().signOut()
        //self.dismiss(animated: false, completion: nil)
    }
    @IBAction func saveHandler(_ sender: Any) {
        handleSaveProfile()
    }
    
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        addressField.resignFirstResponder()
        
        //NotificationCenter.default.removeObserver(self)
    }
    @objc func textFieldChanged(_ target:UITextField) {
        let username = usernameField.text
        let email = emailField.text
        let address = addressField.text
        let formFilled = username != nil && username != "" && email != nil && email != "" && address != nil && address != ""
        setContinueButton(enabled: formFilled)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Resigns the target textField and assigns the next textField in the form.
        
        switch textField {
        case usernameField:
            usernameField.resignFirstResponder()
            emailField.becomeFirstResponder()
            break
        case emailField:
            emailField.resignFirstResponder()
            addressField.becomeFirstResponder()
            break
        case addressField:
            //handleSignUp()
            break
        default:
            break
        }
        return true
    }
    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
    @objc func handleSaveProfile() {
        guard let username = usernameField.text else { return }
//        guard let email = emailField.text else { return }
        guard let address = addressField.text else { return }
        guard let image = profileImageView.image else { return }
        
        setContinueButton(enabled: false)
        activityView.startAnimating()
        
        
        
        // 1. Upload the profile image to Firebase Storage
                
        self.uploadProfileImage(image) { url in
                    
            if url != nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = username
                    changeRequest?.photoURL = url
                    changeRequest?.commitChanges { error in
                            if error == nil {
                                print("User display name changed!")
                                
                                self.saveProfile(username: username, profileImageURL: url!,address: address) { success in
                                    if success {
                                        self.dismiss(animated: true, completion: nil)
                                    }else{
                                        //self.resetForm()
                                    }
                                }
                                
                            } else {
                                print("Error: \(error!.localizedDescription)")
                                //self.resetForm()
                            }
                        }
                    } else {
                //self.resetForm()
                        print("Error unable to upload profile image")
                    }
                }
    }
    
    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
//        let photoUrl = storageRef.child("image/jpg")
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                if let url = metaData?.downloadURL() {
                    completion(url)
                } else {
                    completion(nil)
                }
                // success!
            } else {
                // failed
                completion(nil)
            }
        }
    }
    
    
    
    
    func saveProfile(username:String, profileImageURL:URL, address:String, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        
        let userObject = [
            "username": username,
            "photoURL": profileImageURL.absoluteString
        ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
    func resetForm() {
        let alert = UIAlertController(title: "Error Updating Profile", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        setContinueButton(enabled: true)
        continueButton.setTitle("Continue", for: .normal)
        activityView.stopAnimating()
    }
    override var canBecomeFirstResponder: Bool{
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
        
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
