//
//  GrafiekView.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 03/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

class GrafiekView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        roundCorners(corners: [.bottomRight], radius: 80.0)
//        backgroundColor = .red
    
    }

}
