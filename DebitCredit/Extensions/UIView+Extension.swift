//
//  UIView+Extension.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 03/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
