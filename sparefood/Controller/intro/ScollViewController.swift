//
//  ScollViewController.swift
//  sparefood
//
//  Created by Nelis Lasta on 23/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class ScollViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    var images:[String] =["0","1","2","3"]
    override func viewDidLoad() {
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            pageControl.numberOfPages = images.count
            
            for index in 0..<images.count
            {
                frame.origin.x = scrollView.frame.size.width * CGFloat(index)
                
                frame.size = scrollView.frame.size
                
                let imgView = UIImageView(frame: frame)
                imgView.image = UIImage(named: images[index])
                
                self.scrollView.addSubview(imgView)
            }
            
            scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
            scrollView.delegate = self
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            
            pageControl.currentPage = Int(pageNumber)
        }
        
}


