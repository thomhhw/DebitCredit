//
//  EditCategorienViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 30/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit
import RealmSwift

class EditCategorienViewController: UITableViewController {
    
    var lastTappedCategorie: Categorie?
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categorien"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nieuweCategorie))
    }
    
    @objc func nieuweCategorie() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WijzigCategorieViewController") as! WijzigCategorieViewController
        vc.delegate = self
        vc.isVCEditing = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - TableView Setup
extension EditCategorienViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.categorien.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EditTableViewCell
        cell.delegate = self
        cell.naamCategorie.text = ViewController.categorien[indexPath.row].naam
        cell.naamCategorie.textColor = .white
        cell.categorieAankoop.backgroundColor = ViewController.categorien[indexPath.row].kleur
        cell.backgroundColor = .darkGray
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let index = navigationController!.viewControllers.count - 1
        guard let vc = navigationController?.viewControllers[index] as? MaakTransactieViewController else { return }
        guard let categorie = lastTappedCategorie else { return }
        vc.categorie = categorie
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastTappedCategorie = ViewController.categorien[indexPath.row]
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
//            Categorie.alleCategorien.remove(at: indexPath.row)
            try! realm.write {
                realm.delete(ViewController.categorien[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete Category"
    }
}

//MARK: - EditTableViewCellDelegate
extension EditCategorienViewController: EditTableViewCellDelegate {
    func editTableViewCell(tappedAt cell: EditTableViewCell) {
        let storyboard = UIStoryboard(name: "WijzigTransactieSB", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WijzigCategorieViewController") as! WijzigCategorieViewController
        vc.delegate = self
        vc.isVCEditing = true
        guard let indexpath = tableView.indexPath(for: cell) else { return }
        vc.indexPath = indexpath
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - WijzigCategorieViewControllerDelegate
extension EditCategorienViewController: WijzigCategorieViewControllerDelegate {
    func wijzigCategorieVCDidEndEditing() {
        tableView.reloadData()
    }
}
