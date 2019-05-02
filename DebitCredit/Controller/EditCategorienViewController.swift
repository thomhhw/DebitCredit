//
//  EditCategorienViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 30/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class EditCategorienViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Categorien"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nieuweCategorie))
    }
    
    @objc func nieuweCategorie() {
        let alertController = UIAlertController(title: "Nieuwe categorie", message: "Vul de velden in.", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            let categorieVeld = alertController.textFields![0] as UITextField
            
            if categorieVeld.text != "" {
                print(categorieVeld.text!)
            }
        }))
        
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Categorie"
            textField.textAlignment = .center
        })
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categorie.alleCategorien.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EditTableViewCell
        cell.naamCategorie.text = Categorie.alleCategorien[indexPath.row].naam
        cell.naamCategorie.textColor = .white
        cell.categorieAankoop.backgroundColor = Categorie.alleCategorien[indexPath.row].kleur
        cell.backgroundColor = .darkGray
        return cell
    }
    

}
