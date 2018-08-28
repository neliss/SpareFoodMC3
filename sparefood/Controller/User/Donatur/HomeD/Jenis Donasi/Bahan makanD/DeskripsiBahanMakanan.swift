//
//  DeskripsiBahanMakanan.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class DeskripsiBahanMakanan: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var lblTextFieldBahanMakanan: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var lblTextFieldJumlahDonasi: UITextField!
    @IBAction func btnJumlahDonasi(_ sender: UIStepper) {
        lblTextFieldJumlahDonasi.text = String(sender.value)
    }
    
    @IBOutlet weak var lblDatePickerExpired: UIDatePicker!
    
    @IBOutlet weak var lblDatePickerWaktuPengambilan: UIDatePicker!
    
    @IBOutlet weak var lblTextFieldAlamatPengambilan: UITextField!
    
    @IBOutlet weak var lblBtnGalery: UIButton!
    @IBOutlet weak var lblTakePhoto: UIButton!
    @IBOutlet weak var lblImageView: UIImageView!
    
    @IBAction func btnGalery(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let ambilGambar = UIImagePickerController()
            ambilGambar.delegate = self
            ambilGambar.sourceType = UIImagePickerControllerSourceType.photoLibrary
            ambilGambar.allowsEditing = true
            
        }
    }
    
    @IBAction func btnTakefoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let ambilFoto = UIImagePickerController()
            ambilFoto.delegate = self
            ambilFoto.sourceType = UIImagePickerControllerSourceType.camera
            ambilFoto.allowsEditing = true
            self.present(ambilFoto, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnPostDonasi(_ sender: UIButton) {
        // push ke firebase
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        lblDatePickerExpired?.datePickerMode = .dateAndTime
        lblDatePickerWaktuPengambilan?.datePickerMode = .dateAndTime
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(swipeAction(swipe:)))
        
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        setContinueButton(enabled: false)
        lblTextFieldBahanMakanan.delegate = self
        lblTextFieldJumlahDonasi.delegate = self
        lblTextFieldAlamatPengambilan.delegate = self
        
    
    lblTextFieldAlamatPengambilan.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        lblTextFieldJumlahDonasi.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        lblTextFieldBahanMakanan.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let alamat = lblTextFieldAlamatPengambilan.text
        let jumlahdonasi = lblTextFieldJumlahDonasi.text
        let bahan = lblTextFieldBahanMakanan.text
        
        let formFilled = alamat != nil && alamat != "" && jumlahdonasi != nil && jumlahdonasi != "" && bahan != nil && bahan != ""
        setContinueButton(enabled: formFilled)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSignIn() {
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        setContinueButton(enabled: false)
        
        activityView.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: pass){ user, error in if error == nil && user != nil {
            self.dismiss(animated: false, completion: nil)//            self.performSegue(withIdentifier: "SignInDonaturToHome", sender: self)
        } else{
            print("Error loging in:\(error!.localizedDescription)")
            self.resetForm()
            }
            
        }
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            lblImageView.contentMode = .scaleToFill
            lblImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
        
    }

}
