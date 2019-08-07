//
//  WijzigCategorieViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 05/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit
import RealmSwift

protocol WijzigCategorieViewControllerDelegate: class {
    func wijzigCategorieVCDidEndEditing()
}

class WijzigCategorieViewController: UIViewController {

    @IBOutlet var colorPicker: ColorPicker!
    @IBOutlet var categorieTf: UITextField!
    @IBOutlet var colorView: UIView!
    
    var indexPath: IndexPath!
    private var categorie: Categorie!
    private let realm = try! Realm()
    
    var isVCEditing: Bool!
    
    weak var delegate: WijzigCategorieViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isVCEditing {
            categorie = ViewController.categorien[indexPath.row]
        } else {
            categorie = Categorie(kleur: .white, naam: "")
        }
        
        
        colorPicker.delegate = self
        categorieTf.text = categorie.naam
        colorView.backgroundColor = categorie.kleur
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        categorie.naam = categorieTf.text!
        if isVCEditing {
//            let editedTransactie = ViewController.aankopen[indexPath.row]
//            try! realm.write {
//                editedTransactie.bedrag = bedrag
//                editedTransactie.omschrijving = omschrijving
//                editedTransactie.categorie = categorie
//            }
            let categorieOmTeWijzigen = ViewController.categorien[indexPath.row]
            try! realm.write {
                categorieOmTeWijzigen.naam = categorieTf.text!
            }
            
//            Categorie.alleCategorien[indexPath.row] = categorie
            
        } else {
            try! realm.write {
                realm.add(categorie)
            }
//            Categorie.alleCategorien.append(categorie)
        }
        delegate?.wijzigCategorieVCDidEndEditing()
    }
    
}

//MARK: - ColorPickerDelegate
extension WijzigCategorieViewController: ColorPickerDelegate {
    func ColorColorPickerTouched(sender: ColorPicker, color: UIColor, point: CGPoint, state: UIGestureRecognizer.State) {
        categorie.kleur = color
        colorView.backgroundColor = color
    }
}

