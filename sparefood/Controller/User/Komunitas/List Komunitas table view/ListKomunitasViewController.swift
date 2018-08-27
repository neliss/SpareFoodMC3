//
//  ListKomunitasViewController.swift
//  sparefood
//
//  Created by muhammad sutrisno on 27/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class ListKomunitasViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var lblTableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namaKomunitas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = lblTableView.dequeueReusableCell(withIdentifier: "cellListDonasi") as! CellListDonasi
        
        cell.lblImageView.image = imageKomunitas[indexPath.row]
        cell.lblNamaKomunitas.text = namaKomunitas[indexPath.row]
        
        return cell
    }
    
    var imageKomunitas : [UIImage] = []
    var namaKomunitas : [String] = []
    var listIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTableView.delegate = self
        lblTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblTableView.delegate = self
        lblTableView.dataSource = self
        self.lblTableView.reloadData()
    }

}
