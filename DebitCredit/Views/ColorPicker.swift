//
//  ColorPicker.swift
//  DebitCredit
//
//  Created by Thom Pheijffer on 05/05/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import UIKit
//
//protocol ColorPickerDelegate: class {
//    func colorDidChange(color: UIColor)
//}
//
//
//class ColorPickerView : UIView {
//
//    weak var delegate: ColorPickerDelegate?
//    let saturationExponentTop:Float = 2.0
//    let saturationExponentBottom:Float = 1.3
//
//    let grayPaletteHeightFactor: CGFloat = 0.1
//    var rect_grayPalette = CGRect.zero
//    var rect_mainPalette = CGRect.zero
//
//    // adjustable
//    var elementSize: CGFloat = 1.0 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//
//    private func setup() {
//
//        self.clipsToBounds = true
//        let touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.touchedColor(gestureRecognizer:)))
//        touchGesture.minimumPressDuration = 0
//        touchGesture.allowableMovement = CGFloat.greatestFiniteMagnitude
//        self.addGestureRecognizer(touchGesture)
//    }
//
//
//
//    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//
//        rect_grayPalette = CGRect(x: 0, y: 0, width: rect.width, height: rect.height * grayPaletteHeightFactor)
//        rect_mainPalette = CGRect(x: 0, y: rect_grayPalette.maxY,
//                                  width: rect.width, height: rect.height - rect_grayPalette.height)
//
//        // gray palette
//        for y in stride(from: CGFloat(0), to: rect_grayPalette.height, by: elementSize) {
//
//            for x in stride(from: (0 as CGFloat), to: rect_grayPalette.width, by: elementSize) {
//                let hue = x / rect_grayPalette.width
//
//                let color = UIColor(white: hue, alpha: 1.0)
//
//                context!.setFillColor(color.cgColor)
//                context!.fill(CGRect(x:x, y:y, width:elementSize, height:elementSize))
//            }
//        }
//
//        // main palette
//        for y in stride(from: CGFloat(0), to: rect_mainPalette.height, by: elementSize) {
//
//            var saturation = y < rect_mainPalette.height / 2.0 ? CGFloat(2 * y) / rect_mainPalette.height : 2.0 * CGFloat(rect_mainPalette.height - y) / rect_mainPalette.height
//            saturation = CGFloat(powf(Float(saturation), y < rect_mainPalette.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
//            let brightness = y < rect_mainPalette.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(rect_mainPalette.height - y) / rect_mainPalette.height
//
//            for x in stride(from: (0 as CGFloat), to: rect_mainPalette.width, by: elementSize) {
//                let hue = x / rect_mainPalette.width
//
//                let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
//
//                context!.setFillColor(color.cgColor)
//                context!.fill(CGRect(x:x, y: y + rect_mainPalette.origin.y,
//                                     width: elementSize, height: elementSize))
//            }
//        }
//    }
//
//
//
//    func getColorAtPoint(point: CGPoint) -> UIColor
//    {
//        var roundedPoint = CGPoint(x:elementSize * CGFloat(Int(point.x / elementSize)),
//                                   y:elementSize * CGFloat(Int(point.y / elementSize)))
//
//        let hue = roundedPoint.x / self.bounds.width
//
//
//        // main palette
//        if rect_mainPalette.contains(point)
//        {
//            // offset point, because rect_mainPalette.origin.y is not 0
//            roundedPoint.y -= rect_mainPalette.origin.y
//
//            var saturation = roundedPoint.y < rect_mainPalette.height / 2.0 ? CGFloat(2 * roundedPoint.y) / rect_mainPalette.height
//                : 2.0 * CGFloat(rect_mainPalette.height - roundedPoint.y) / rect_mainPalette.height
//
//            saturation = CGFloat(powf(Float(saturation), roundedPoint.y < rect_mainPalette.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
//            let brightness = roundedPoint.y < rect_mainPalette.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(rect_mainPalette.height - roundedPoint.y) / rect_mainPalette.height
//
//            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
//        }
//            // gray palette
//        else{
//
//            return UIColor(white: hue, alpha: 1.0)
//        }
//    }
//
//    /*
//     func getPointForColor(color:UIColor) -> CGPoint {
//     var hue:CGFloat=0;
//     var saturation:CGFloat=0;
//     var brightness:CGFloat=0;
//     color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil);
//
//     var yPos:CGFloat = 0
//     let halfHeight = (self.bounds.height / 2)
//
//     if (brightness >= 0.99) {
//     let percentageY = powf(Float(saturation), 1.0 / saturationExponentTop)
//     yPos = CGFloat(percentageY) * halfHeight
//     } else {
//     //use brightness to get Y
//     yPos = halfHeight + halfHeight * (1.0 - brightness)
//     }
//
//     let xPos = hue * self.bounds.width
//
//     return CGPoint(x: xPos, y: yPos)
//     }
//     */
//
//    @objc func touchedColor(gestureRecognizer: UILongPressGestureRecognizer){
//        let point = gestureRecognizer.location(in: self)
//        let color = getColorAtPoint(point: point)
//
//        self.delegate?.colorDidChange(color: color)
//    }
//}


internal protocol ColorPickerDelegate : NSObjectProtocol {
    func ColorColorPickerTouched(sender:ColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizer.State)
}

@IBDesignable
class ColorPicker : UIView {
    
    weak internal var delegate: ColorPickerDelegate?
    let saturationExponentTop:Float = 2.0
    let saturationExponentBottom:Float = 1.3
    
    @IBInspectable var elementSize: CGFloat = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    private func initialize() {
        
        self.clipsToBounds = true
        let touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.touchedColor(gestureRecognizer:)))
        touchGesture.minimumPressDuration = 0
        touchGesture.allowableMovement = CGFloat.greatestFiniteMagnitude
        self.addGestureRecognizer(touchGesture)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        for y in stride(from: (0 as CGFloat), to: rect.height, by: elementSize) {
            
            var saturation = y < rect.height / 2.0 ? CGFloat(2 * y) / rect.height : 2.0 * CGFloat(rect.height - y) / rect.height
            saturation = CGFloat(powf(Float(saturation), y < rect.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
            let brightness = y < rect.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(rect.height - y) / rect.height
            
            for x in stride(from: (0 as CGFloat), to: rect.width, by: elementSize) {
                let hue = x / rect.width
                let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
                context!.setFillColor(color.cgColor)
                context!.fill(CGRect(x:x, y:y, width:elementSize,height:elementSize))
            }
        }
    }
    
    func getColorAtPoint(point:CGPoint) -> UIColor {
        let roundedPoint = CGPoint(x:elementSize * CGFloat(Int(point.x / elementSize)),
                                   y:elementSize * CGFloat(Int(point.y / elementSize)))
        var saturation = roundedPoint.y < self.bounds.height / 2.0 ? CGFloat(2 * roundedPoint.y) / self.bounds.height
            : 2.0 * CGFloat(self.bounds.height - roundedPoint.y) / self.bounds.height
        saturation = CGFloat(powf(Float(saturation), roundedPoint.y < self.bounds.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
        let brightness = roundedPoint.y < self.bounds.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(self.bounds.height - roundedPoint.y) / self.bounds.height
        let hue = roundedPoint.x / self.bounds.width
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    func getPointForColor(color:UIColor) -> CGPoint {
        var hue:CGFloat=0;
        var saturation:CGFloat=0;
        var brightness:CGFloat=0;
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil);
        
        var yPos:CGFloat = 0
        let halfHeight = (self.bounds.height / 2)
        
        if (brightness >= 0.99) {
            let percentageY = powf(Float(saturation), 1.0 / saturationExponentTop)
            yPos = CGFloat(percentageY) * halfHeight
        } else {
            //use brightness to get Y
            yPos = halfHeight + halfHeight * (1.0 - brightness)
        }
        
        let xPos = hue * self.bounds.width
        
        return CGPoint(x: xPos, y: yPos)
    }
    
    @objc func touchedColor(gestureRecognizer: UILongPressGestureRecognizer){
        let point = gestureRecognizer.location(in: self)
        let color = getColorAtPoint(point: point)
        
        self.delegate?.ColorColorPickerTouched(sender: self, color: color, point: point, state:gestureRecognizer.state)
    }
}
