//
//  ViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 11-04-19.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
//    static var aankopen: [TransactieIC] = [ TransactieIC(bedrag: 20.88, omschrijving: "Lunch", categorie: Categorie(kleur: .yellow, naam: "Eten"), datum: Date(timeIntervalSince1970: 7373737), herhaling: Herhaling()),
//                                   TransactieIC(bedrag: 20.88, omschrijving: "Voetbalschoenen", categorie: Categorie(kleur: .red, naam: "Sport"), datum: Date(timeIntervalSince1970: 84848), herhaling: Herhaling()),
//                                   TransactieIC(bedrag: -38.28, omschrijving: "Geld Opname", categorie: Categorie(kleur: .blue, naam: "Geld"), datum: Date(), herhaling: Herhaling())]
    
    static var aankopen: Results<Transactie>!
    static var categorien: Results<Categorie>!
    

    @IBOutlet private var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var balansLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var grafiekView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.aankopen = realm.objects(Transactie.self)
        ViewController.categorien = realm.objects(Categorie.self)
        
        setupTableView()
        calculateBalansLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        calculateBalansLabel()
    }

    @IBAction func maakNieuweTransactie(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MaakTransactieVC") as! MaakTransactieViewController
        vc.isEditingTransaction = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupTableView() {
        heightConstraint.constant = self.view.bounds.height/(100/45)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        
        ViewController.aankopen = ViewController.aankopen.sorted(byKeyPath: "datum", ascending: false)
    }
 
    func calculateBalansLabel() {
        var balans: Double = 0
        for aankoop in ViewController.aankopen {
            balans += aankoop.bedrag
        }
        balans = balans * 100
        balans = balans.rounded()
        balans = balans / 100
        balansLabel.text = "$\(balans)"
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.aankopen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TransactionTableViewCell
        cell.populate(with: ViewController.aankopen[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MaakTransactieVC") as! MaakTransactieViewController
        vc.isEditingTransaction = true
        vc.indexPath = indexPath
        vc.transactie = ViewController.aankopen[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            let objectToDelete = ViewController.aankopen[indexPath.row]
//            ViewController.aankopen.remove(at: indexPath.row)
            try! realm.write {
                realm.delete(objectToDelete)
            }

            tableView.deleteRows(at: [indexPath], with: .fade)
            calculateBalansLabel()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete Transaction"
    }
    
}
