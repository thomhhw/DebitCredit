//
//  UIColor+Extension.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 03/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

extension UIColor {
    func toString() -> String {
         let colorRef = self.cgColor
         return CIColor(cgColor: colorRef).stringRepresentation
    }
}
