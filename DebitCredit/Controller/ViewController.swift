//
//  ViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 11-04-19.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let aankopen: [Transactie] = [ Transactie(bedrag: 20.88, omschrijving: "Voetbalschoenen", categorie: Categorie(kleur: .red, naam: "Sport"), datum: Date(), herhaling: Herhaling(), afschrijving: false),
                                   Transactie(bedrag: 20.88, omschrijving: "Voetbalschoenen", categorie: Categorie(kleur: .red, naam: "Sport"), datum: Date(), herhaling: Herhaling(), afschrijving: true),
                                   Transactie(bedrag: 20.88, omschrijving: "Voetbalschoenen", categorie: Categorie(kleur: .red, naam: "Sport"), datum: Date(), herhaling: Herhaling(), afschrijving: false)]

    @IBOutlet private var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var balansLabel: UILabel!
    @IBOutlet var tableView: UITableView!
//    @IBOutlet var grafiekView: UIView!
    @IBOutlet var grafiekView: GrafiekView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightConstraint.constant = self.view.bounds.height/(100/45)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .black
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func maakNieuweTransactie(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MaakTransactieVC") as! MaakTransactieViewController
        vc.afschrijving = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func maakNieuweAfschrijving(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MaakTransactieVC") as! MaakTransactieViewController
        vc.afschrijving = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aankopen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TransactionTableViewCell
        cell.populate(with: aankopen[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
