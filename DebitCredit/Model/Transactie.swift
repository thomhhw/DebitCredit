//
//  Transactie.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 30/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Transactie: Object {
    @objc dynamic var bedrag: Double = 0
    @objc dynamic var omschrijving: String = ""
    
    @objc dynamic var categorie: Categorie?
    @objc dynamic var datum: Date = Date()
    
    var herhaling: Herhaling?
    
    convenience init(bedrag: Double, omschrijving: String, categorie: Categorie, datum: Date, herhaling: Herhaling) {
        self.init()
        self.bedrag = bedrag
        self.omschrijving = omschrijving
        self.categorie = categorie
        self.datum = datum
        self.herhaling = herhaling
    }
    
}

struct Herhaling {
    
}


//TransactieIC(bedrag: 20.88, omschrijving: "Lunch", categorie: Categorie(kleur: .yellow, naam: "Eten"), datum: Date(timeIntervalSince1970: 7373737), herhaling: Herhaling())
