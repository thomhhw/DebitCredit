//
//  EditTableViewCell.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 02/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

protocol EditTableViewCellDelegate: class {
    func editTableViewCell(tappedAt cell: EditTableViewCell)
}

class EditTableViewCell: UITableViewCell {
    
    @IBOutlet var categorieAankoop: UIView!
    @IBOutlet var naamCategorie: UILabel!
    @IBOutlet var infoButton: UIButton!
    
    weak var delegate: EditTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func infoButtonTapped(_ sender: Any) {
        delegate?.editTableViewCell(tappedAt: self)
    }
    
}
