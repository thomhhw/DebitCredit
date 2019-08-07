//
//  Categorie.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 28/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Categorie: Object {
        
    @objc dynamic private var _kleur = ""

    var kleur: UIColor {
      get {
        let ciColor = CIColor(string: _kleur)
        return UIColor(ciColor: ciColor)
        }
      set { _kleur = newValue.toString() }
    }
    
    @objc dynamic var naam: String = ""
    
    convenience init(kleur: UIColor, naam: String) {
        self.init()
        self.kleur = kleur
        self.naam = naam
    }
    
    
    
//    static var alleCategorien = [Categorie(kleur: .red, naam: "Geen"), Categorie(kleur: .yellow, naam: "Primaire levensmiddelen"), Categorie(kleur: .green, naam: "Belastingen"), Categorie(kleur: .orange, naam: "Vrije tijds bestedingen"), Categorie(kleur: .blue, naam: "Boodschappen")]
//    static var alleCategorien: Results<Categorie>!
}

