//
//  AccuracyView.swift
//  BeaconHunt
//
//  Created by Joe E. on 11/10/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

private let INSET:CGFloat = 1

@IBDesignable class AccuracyView: UIView {
    
    var beaconColor: UIColor = UIColor.lightGrayColor() {
        didSet { setNeedsDisplay() }
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        beaconColor.set()
        
        let insetRect = CGRectInset(rect, INSET, INSET)
        CGContextStrokeEllipseInRect(context, insetRect)
        
    }

}