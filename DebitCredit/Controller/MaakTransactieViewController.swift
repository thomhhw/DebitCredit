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
    
    var categorie = Categorie.alleCategorien.first! {
        didSet {
            categorieButton.titleLabel?.text = categorie.naam
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(transactieDone))
        title = "$0"
    }
    
   
    @objc func transactieDone() {
        let bedrag = Double(hoeveelheidTextfield.text!)!
        let omschrijving = omschrijvingTextfield.text!
        let datum = Date()

        let transactie = TransactieIC(bedrag: bedrag, omschrijving: omschrijving, categorie: categorie, datum: datum, herhaling: Herhaling())
        ViewController.aankopen.insert(transactie, at: 0)
//        #warning("Add transactie")
        
        ViewController.isDirty = true
        
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func kiesCategorie(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditCategorienVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func kiesHerhalingen(_ sender: Any) {
    }
    
    
    

}


extension MaakTransactieViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        title = "$" + hoeveelheidTextfield.text!
    }
    
}
