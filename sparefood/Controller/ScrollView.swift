//
//  scrollView.swift
//  sparefood
//
//  Created by Nelis Lasta on 22/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import Foundation
class ScrollView: UIScrollView , UIScrollViewDelegate {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Thread.sleep(forTimeInterval: 5.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
