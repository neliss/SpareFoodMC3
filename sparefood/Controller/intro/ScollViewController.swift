//
//  ScollViewController.swift
//  sparefood
//
//  Created by Nelis Lasta on 23/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class ScollViewController: UIViewController {

    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
            leftSwipe.direction = UISwipeGestureRecognizerDirection.left
            self.view.addGestureRecognizer(leftSwipe)
            
            
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
            rightSwipe.direction = UISwipeGestureRecognizerDirection.right
            self.view.addGestureRecognizer(rightSwipe)
        }
    
}


