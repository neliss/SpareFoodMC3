//
//  JenisMinuman.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class JenisMinuman: UIViewController {

    @IBOutlet weak var lblBtnSusu: UIButton!
    @IBAction func btnSusu(_ sender: UIButton) {
    }
    
    @IBOutlet weak var lblBtnAirMineral: UIButton!
    @IBAction func btnAirMineral(_ sender: UIButton) {
    }
    
    @IBOutlet weak var lblBtnTeh: UIButton!
    @IBAction func btnTeh(_ sender: UIButton) {
    }
    
    @IBOutlet weak var lblBtnIsotonic: UIButton!
    @IBAction func btnIsotonic(_ sender: UIButton) {
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

extension UIViewController{
    @objc func swipeAction(swipe: UISwipeGestureRecognizer){
        switch swipe.direction.rawValue {
        case  1:
            self.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "swipeRight", sender: self)
        default:
            break
        }
    }
}
