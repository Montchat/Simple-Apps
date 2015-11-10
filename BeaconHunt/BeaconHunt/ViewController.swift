//
//  ViewController.swift
//  BeaconHunt
//
//  Created by Joe E. on 11/10/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

private let UUID_STRING = "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
private let IDENTIFIER = "beacons"

let estimoteGreen = UIColor(red:0.69, green:0.82, blue:0.7, alpha:1)
let estimoteBlue = UIColor(red:0.69, green:0.83, blue:0.9, alpha:1)
let estimotePurple = UIColor(red:0.31, green:0.28, blue:0.52, alpha:1)

class ViewController: UIViewController {

    let beaconManager = ESTBeaconManager()
    
    @IBOutlet weak var beaconProximityLabel: UILabel!
    @IBOutlet weak var beaconImageView: UIImageView!
    @IBOutlet weak var beaconAccuracyView: AccuracyView!
    
    enum BeaconColor:Int {
        case Green = 100, Blue = 200, Purple = 300
        
        func color() -> UIColor {
            switch self {
                
            case .Green: return estimoteGreen
            case .Blue: return estimoteBlue
            case .Purple: return estimotePurple
                
            }
            
        }
        
        func image() -> UIImage? {
            switch self {
            case .Green: return UIImage(named: "beacon_green")
            case .Blue: return UIImage(named: "beacon_blue")
            case .Purple: return UIImage(named: "beacon_purple")

                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beaconManager.delegate = self
//        shakeView()
        beaconImageView.layer.anchorPoint = view.center
        beaconManager.requestAlwaysAuthorization()
        
        if let uuid = NSUUID(UUIDString: UUID_STRING) {
            let region = CLBeaconRegion(proximityUUID: uuid, identifier: IDENTIFIER)
            
            beaconManager.startRangingBeaconsInRegion(region)
        
        }
        
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        guard let beacon = beacons.first else { return }
        
        print(beacon.major,beacon.minor, beacon.accuracy, beacon.proximity.rawValue)
        
        let color = BeaconColor(rawValue: beacon.major.integerValue)?.color() ?? UIColor.lightGrayColor()
        
        beaconProximityLabel.textColor = color
        beaconAccuracyView.beaconColor = color
        
        let image = BeaconColor(rawValue: beacon.major.integerValue)?.image() ?? UIImage(named:"beacon_grey")
        beaconImageView.image = image
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shakeView() {
        var shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 1
        shake.repeatCount = HUGE
        shake.autoreverses = true
        
        var from_Point:CGPoint = CGPointMake(beaconImageView.center.x, beaconImageView.center.y - 10)
        var from_Value:NSValue = NSValue(CGPoint: from_Point)
        var to_Point: CGPoint = CGPointMake(beaconImageView.center.x, beaconImageView.center.y + 10)
        var to_Value:NSValue = NSValue(CGPoint: to_Point)
        
        
        shake.fromValue = from_Value
        shake.toValue = to_Value
        beaconImageView.layer.addAnimation(shake, forKey: "position")
        
    }

}

extension ViewController : ESTBeaconManagerDelegate {
    
}