//
//  WijzigCategorieViewController.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 05/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class WijzigCategorieViewController: UIViewController {

    @IBOutlet var colorPicker: ColorPicker!
    @IBOutlet var categorieTf: UITextField!
    @IBOutlet var colorView: UIView!
    
    var categorie: Categorie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorPicker.delegate = self
        categorieTf.text = categorie.naam
        colorView.backgroundColor = categorie.kleur
    }
    
}

extension WijzigCategorieViewController: ColorPickerDelegate {
    func ColorColorPickerTouched(sender: ColorPicker, color: UIColor, point: CGPoint, state: UIGestureRecognizer.State) {
        colorView.backgroundColor = color
    }
}

