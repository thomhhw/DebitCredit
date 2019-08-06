//
//  Double+Extension.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 28/04/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

extension Double {
    func maakBedragString() -> String {
        if self < 0 {
            let getal = abs(self)
            return "-$\(getal)"
        } else {
            return "$\(self)"
        }
        
    }
}

