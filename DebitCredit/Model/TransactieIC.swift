//
//  Transactie.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 30/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import Foundation

struct TransactieIC {
    var bedrag: Double
    var omschrijving: String
    
    var categorie: Categorie
//    var typeAankoop: String
    var datum: Date
    
    var herhaling: Herhaling
}

struct Herhaling {
    
}


