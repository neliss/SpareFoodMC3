//
//  DeskripsiBahanMakanan.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class DeskripsiBahanMakanan: UIViewController {

    @IBOutlet weak var lblTextFieldBahanMakanan: UITextField!
    
    @IBOutlet weak var lblTextFieldJumlahDonasi: UITextField!
    @IBAction func btnJumlahDonasi(_ sender: UIStepper) {
    }
    
    @IBOutlet weak var lblDatePickerExpired: UIDatePicker!
    
    @IBOutlet weak var lblDatePickerWaktuPengambilan: UIDatePicker!
    
    @IBOutlet weak var lblTextFieldAlamatPengambilan: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action:#selector(swipeAction(swipe:)))
        
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
