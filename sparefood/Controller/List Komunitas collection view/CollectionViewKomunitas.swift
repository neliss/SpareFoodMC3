//
//  CollectionViewKomunitas.swift
//  sparefood
//
//  Created by Nelis Lasta on 27/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class CollectionViewKomunitas: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let Community = ["FoodBank Of Indonesia","HungerBank","Dont Waste Food","Share The Meal","Peduli Gizi"]
    let CommunityImage: [UIImage] = [
        UIImage(named: "Foi")!,
        UIImage(named: "fb")!,
        UIImage(named: "Dwf")!,
        UIImage(named: "stm")!,
        UIImage(named: "pg")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      layout.sectionInset = UIEdgeInsetsMake(0,5,0,5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width -20)/2, height: self.collectionView.frame.size.height/3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Community.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! CollectionViewCell
        
        cell.communityLabel.text = Community[indexPath.item]
        cell.communityImageView.image = CommunityImage[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    func

}
