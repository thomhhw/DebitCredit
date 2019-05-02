//
//  Categorie.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 28/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

struct Categorie {
    var kleur: UIColor
    var naam: String
    
    static let alleCategorien = [Categorie(kleur: .red, naam: "Geen"), Categorie(kleur: .yellow, naam: "Primaire levensmiddelen"), Categorie(kleur: .green, naam: "Belastingen"), Categorie(kleur: .orange, naam: "Vrije tijds bestedingen"), Categorie(kleur: .blue, naam: "Boodschappen")]
}
