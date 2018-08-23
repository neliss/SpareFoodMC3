//
//  RootPageView.swift
//  sparefood
//
//  Created by Nelis Lasta on 23/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class RootPageView: UIPageViewController , UIPageViewControllerDataSource{
    
    Lazy var pageControllerList: [UIViewController] ={
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateInitialViewController(withIdentifier: "Page1")
        let vc2 = sb.instantiateInitialViewController(withIdentifier: "Page2")
        let vc3 = sb.instantiateInitialViewController(withIdentifier: "Page3")
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        if let firstPage = pageControllerList.first{
            self.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = pageControllerList.index(of: viewController) else {return nil}
        let previeosIndex = vcIndex - 1
        guard previeosIndex >= 0 else {return nil}
        guard pageControllerList.count > previeosIndex else {return nil}
        return pageControllerList [previeosIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = pageControllerList.index(of: viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard pageControllerList .count != nextIndex else {return nil}
        guard pageControllerList . count > nextIndex else {return nil}
        return pageControllerList[nextIndex]
    }
}
