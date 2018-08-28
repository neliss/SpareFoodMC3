//
//  CellListDonation.swift
//  sparefood
//
//  Created by muhammad sutrisno on 27/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class CellListDonation: UITableViewCell {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDonasi: UILabel!
    @IBOutlet weak var lblNamaDonatur: UILabel!
    @IBOutlet weak var lblJumlahDonasi: UILabel!
    @IBOutlet weak var lblImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
