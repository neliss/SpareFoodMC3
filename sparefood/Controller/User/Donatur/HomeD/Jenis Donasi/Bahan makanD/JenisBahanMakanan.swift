//
//  JenisBahanMakanan.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class JenisBahanMakanan: UIViewController {

    @IBOutlet weak var lblBtnBeras: UIButton!
    @IBAction func btnBeras(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnTelur: UIButton!
    @IBAction func btnTelur(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnMinyak: UIButton!
    @IBAction func btnMinyak(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnKecap: UIButton!
    @IBAction func btnKecap(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnSauce: UIButton!
    @IBAction func btnSauce(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnTepung: UIButton!
    @IBAction func btnTepung(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnBumbuDapur: UIButton!
    @IBAction func btnBumbuDapur(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    @IBOutlet weak var lblBtnMieInstant: UIButton!
    @IBAction func btnMieInstant(_ sender: UIButton) {
        performSegue(withIdentifier: "BahanMakananToPost", sender: Any)
    }
    
    
    
    
    
    
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
