//
//  EditTableViewCell.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 02/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class EditTableViewCell: UITableViewCell {
    
    @IBOutlet var categorieAankoop: UIView!
    @IBOutlet var naamCategorie: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
