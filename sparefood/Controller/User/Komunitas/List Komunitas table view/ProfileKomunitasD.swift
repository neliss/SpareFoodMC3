//
//  ProfileKomunitasD.swift
//  sparefood
//
//  Created by muhammad sutrisno on 27/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class ProfileKomunitasD: UIViewController {

    @IBOutlet weak var lblImageView: UIImageView!
    @IBOutlet weak var lblNamaKomunitas: UILabel!
    @IBOutlet weak var lblEmailKomunitas: UILabel!
    @IBOutlet weak var lblNomotTelphoneKomunitas: UILabel!
    @IBOutlet weak var textViewAlamat: UITextView!
    
    @IBAction func btnDonate(_ sender: UIButton) {
//        push to firebase
        
        
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
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
