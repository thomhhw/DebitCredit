//
//  EditCategorienViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 30/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class EditCategorienViewController: UITableViewController {
    
    var lastTappedCategorie: Categorie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Categorien"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nieuweCategorie))
    }
    
    @objc func nieuweCategorie() {
        //        let alertController = UIAlertController(title: "Nieuwe categorie", message: "Vul de velden in.", preferredStyle: .alert)
        //
        //        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
        //            alert -> Void in
        //            let categorieVeld = alertController.textFields![0] as UITextField
        //
        //            if categorieVeld.text != "" {
        //                print(categorieVeld.text!)
        //            }
        //        }))
        //
        //        alertController.addTextField(configurationHandler: { (textField) -> Void in
        //            textField.placeholder = "Categorie"
        //            textField.textAlignment = .center
        //        })
        //
        //        self.present(alertController, animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WijzigCategorieViewController") as! WijzigCategorieViewController
        vc.delegate = self
        vc.isVCEditing = false
//        vc.indexPath = indexpath
        //        vc.categorie = Categorie.alleCategorien[indexpath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categorie.alleCategorien.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EditTableViewCell
        cell.delegate = self
        cell.naamCategorie.text = Categorie.alleCategorien[indexPath.row].naam
        cell.naamCategorie.textColor = .white
        cell.categorieAankoop.backgroundColor = Categorie.alleCategorien[indexPath.row].kleur
        cell.backgroundColor = .darkGray
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let index = navigationController!.viewControllers.count - 1
        guard let vc = navigationController?.viewControllers[index] as? MaakTransactieViewController else { return }
        guard let categorie = lastTappedCategorie else { return }
        vc.categorie = categorie
        print(categorie)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastTappedCategorie = Categorie.alleCategorien[indexPath.row]
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            Categorie.alleCategorien.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete Category"
    }
    
}

extension EditCategorienViewController: EditTableViewCellDelegate {
    func editTableViewCell(tappedAt cell: EditTableViewCell) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WijzigCategorieViewController") as! WijzigCategorieViewController
        vc.delegate = self
        vc.isVCEditing = true
        guard let indexpath = tableView.indexPath(for: cell) else { return }
        vc.indexPath = indexpath
        //        vc.categorie = Categorie.alleCategorien[indexpath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension EditCategorienViewController: WijzigCategorieViewControllerDelegate {
    func wijzigCategorieVCDidEndEditing() {
        tableView.reloadData()
    }
}
