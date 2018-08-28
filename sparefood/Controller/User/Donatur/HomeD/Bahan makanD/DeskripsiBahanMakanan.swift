//
//  DeskripsiBahanMakanan.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class DeskripsiBahanMakanan: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var lblTextFieldBahanMakanan: UITextField!
    
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

        // Do any additional setup after loading the view.
        
        lblDatePickerExpired?.datePickerMode = .dateAndTime
        lblDatePickerWaktuPengambilan?.datePickerMode = .dateAndTime
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(swipeAction(swipe:)))
        
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            lblImageView.contentMode = .scaleToFill
            lblImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

}
