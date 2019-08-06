//
//  MaakTransactieViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 30/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class MaakTransactieViewController: UIViewController {
    
    @IBOutlet var hoeveelheidTextfield: UITextField!
    @IBOutlet var omschrijvingTextfield: UITextField!
    @IBOutlet var categorieButton: UIButton!
    @IBOutlet var titelTekst: UILabel!
    
    var isEditingTransaction: Bool!
    var indexPath: IndexPath!
    var transactie: TransactieIC!
    
    var categorie = Categorie.alleCategorien.first! {
        didSet {
            categorieButton.setTitle(categorie.naam, for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(transactieDone))
        title = "$0"
        
        if isEditingTransaction {
            titelTekst.text = "Wijzig uw transactie"
            hoeveelheidTextfield.text = String(transactie.bedrag)
            omschrijvingTextfield.text = transactie.omschrijving
            categorie = transactie.categorie
            categorieButton.setTitle(categorie.naam, for: .normal)
            calculateTitle()
        } else {
            titelTekst.text = "Maak een nieuwe transactie"
        }
        
    }
    
   
    @objc func transactieDone() {
        let bedrag = Double(hoeveelheidTextfield.text!)!
        let omschrijving = omschrijvingTextfield.text!
        if isEditingTransaction {
            transactie.bedrag = bedrag
            transactie.omschrijving = omschrijving
            transactie.categorie = categorie
            ViewController.aankopen[indexPath.row] = transactie
        } else {
            let datum = Date()
            
            let transactie = TransactieIC(bedrag: bedrag, omschrijving: omschrijving, categorie: categorie, datum: datum, herhaling: Herhaling())
            ViewController.aankopen.insert(transactie, at: 0)
        }
        navigationController?.popViewController(animated: true)

    }
    
    func calculateTitle() {
        guard let double = Double(hoeveelheidTextfield.text!) else { return }
        title = double.maakBedragString()
    }
    
    @IBAction func kiesCategorie(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditCategorienVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func kiesHerhalingen(_ sender: Any) {
    }
    
}

//MARK: - UITextFieldDelegate
extension MaakTransactieViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculateTitle()
    }
}
