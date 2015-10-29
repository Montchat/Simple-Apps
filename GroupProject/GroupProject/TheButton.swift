//
//  TheButon.swift
//  GroupProject
//
//  Created by Joe E. on 10/29/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

@IBDesignable

class TheButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0
    
    override func drawRect(rect:CGRect) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
    
    }

}