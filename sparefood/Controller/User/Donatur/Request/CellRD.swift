//
//  CellRD.swift
//  sparefood
//
//  Created by muhammad sutrisno on 27/08/18.
//  Copyright © 2018 Nelis Lasta. All rights reserved.
//

import UIKit

class CellRD: UITableViewCell {

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var lblDonasi: UILabel!
    @IBOutlet weak var lbltanggal: UILabel!
    @IBOutlet weak var lblpesan: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
