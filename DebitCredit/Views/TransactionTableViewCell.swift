//
//  TransactionTableViewCell.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 28/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet var datumLabel: UILabel!
    @IBOutlet var typeAankopLabel: UILabel!
    @IBOutlet var categorieAankoop: UIView!
    @IBOutlet var bedragAankoop: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(with transactie: TransactieIC) {
        bedragAankoop.text = transactie.bedrag.maakBedragString()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        datumLabel.text = dateFormatter.string(from: transactie.datum)
        typeAankopLabel.text = transactie.omschrijving
        categorieAankoop.backgroundColor = transactie.categorie.kleur
    }

}
