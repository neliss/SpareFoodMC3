//
//  CommunityViewController.swift
//  sparefood
//
//  Created by Nelis Lasta on 28/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let community = ["Foodbank Of Indonesia","Dont Waste Food","Share Meal","Hunger Bank","Peduli Gizi"]
    
    let communityImage: [UIImage] = [
    UIImage(named: "Foi")!,
    UIImage(named: "Dwf")!,
    UIImage(named: "Sm")!,
    UIImage(named: "hb")!,
    UIImage(named: "pg")!,
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
collectionView.dataSource = self
        collectionView.delegate = self




var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width -20)/2, height: self.collectionView.frame.size.height/3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return community.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: IndexPath) as! CollectionViewCell
    
        
        cell.communityLabel.text = community[indexPath.item]
        cell.communityViewImage.image = communityImage[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0,5
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desPk = mainStoryboard.instantiateViewController(withIdentifier: "ProfileKomunitasD") as! ProfileKomunitasD
        self.navigationController?.pushViewController(desPk, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: IndexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: IndexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0,5
    }
    
}
