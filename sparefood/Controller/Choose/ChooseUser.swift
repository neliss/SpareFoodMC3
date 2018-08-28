//
//  ChooseUser.swift
//  sparefood
//
//  Created by muhammad sutrisno on 20/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class ChooseUser: UIViewController {

    
    @IBOutlet weak var lblBtnDonatur: UIButton!
    
    @IBOutlet weak var lblBtnKomunitas: UIButton!
    
    @IBAction func btnDonatur(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "keDonatur", sender: self)
    }
    
    @IBAction func btnKomunitas(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "keKomunitas", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        
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
