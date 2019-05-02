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
    
    @IBOutlet var pickerView: UIPickerView!
    
    var isEditingCategorie = false
    var categorie = Categorie.alleCategorien.first!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePickerViewState(to: .hidden)
        let gr = UILongPressGestureRecognizer(target: self, action: #selector(editCategories))
        pickerView.addGestureRecognizer(gr)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(transactieDone))
        title = "$0"
    }
    
    @objc func editCategories() {
        if !isEditingCategorie {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "EditCategorienVC")
            navigationController?.pushViewController(vc, animated: true)
        }
        isEditingCategorie = true
    }
    
    @objc func transactieDone() {
        let bedrag = Double(hoeveelheidTextfield.text!)!
        let omschrijving = omschrijvingTextfield.text!
        let datum = Date()
        let transactie = Transactie(bedrag: bedrag, omschrijving: omschrijving, categorie: categorie, datum: datum, herhaling: Herhaling())
        #warning("Add transactie")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func kiesCategorie(_ sender: Any) {
        changePickerViewState(to: .shown)
    }
    
    @IBAction func kiesHerhalingen(_ sender: Any) {
        changePickerViewState(to: .hidden)
    }
    
    @IBAction func afschrijvingVeranderd(_ sender: Any) {
        changePickerViewState(to: .hidden)
    }
    
    enum PickerViewState {
        case hidden
        case shown
    }
    
    
    func changePickerViewState(to state: PickerViewState) {
        if state == .hidden {
            pickerView.isHidden = true
        } else {
            pickerView.isHidden = false
            view.endEditing(true)
        }
    }

}

extension MaakTransactieViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categorie.alleCategorien.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        categorieButton.setTitle(Categorie.alleCategorien[row].naam, for: .normal)
        categorie = Categorie.alleCategorien[row]
//        if hoeveelheidTextfield.text != "" {
//            title = "$" + hoeveelheidTextfield.text! + " - " + categorien[row]
//        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: Categorie.alleCategorien[row].naam, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
}

extension MaakTransactieViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        title = "$" + hoeveelheidTextfield.text!
    }
    
}
