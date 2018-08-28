//
//  ProfileKomuitasD.swift
//  sparefood
//
//  Created by muhammad sutrisno on 28/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class ProfileKomuitasD: UIViewController {

    
    @IBOutlet weak var lblEmail : UILabel!
    @IBOutlet weak var lblNomorTelphone : UILabel!
    @IBOutlet weak var lblAlamat : UITextView!
    
    @IBOutlet weak var lblImageView : UIImageView!
    

    @IBAction func btnDonasi(_ sender: UIButton) {
//        push ke fire base
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
