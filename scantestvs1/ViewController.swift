//
//  ViewController.swift
//  ScanTest02
//
//  Created by Mohul Varma on 09/04/19.
//  Copyright © 2019 Mohul Varma. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth
//dasdla

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    var ViewControl = UIViewController()
    
    var localBeacon: CLBeaconRegion!
    var beaconPeripheralData: NSDictionary!
    var peripheralManager: CBPeripheralManager!
    
    func initLocalBeacon() {
        if localBeacon != nil {
            initLocalBeacon()
        }
        
        let localBeaconUUID = "39ED98FF-2900-441A-802F-9C398FC1TEST"
        let localBeaconMajor: CLBeaconMajorValue = 123
        let localBeaconMinor: CLBeaconMinorValue = 456
        
        let uuid = UUID(uuidString: localBeaconUUID)!
        localBeacon = CLBeaconRegion(proximityUUID: uuid, major: localBeaconMajor, minor: localBeaconMinor, identifier: "UR MOM GAY")
        
        beaconPeripheralData = localBeacon.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    }
    
    func stopLocalBeacon() {
        peripheralManager.stopAdvertising()
        peripheralManager = nil
        beaconPeripheralData = nil
        localBeacon = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            peripheralManager.startAdvertising(beaconPeripheralData as? [String: Any])
        } else if peripheral.state == .poweredOff {
            peripheralManager.stopAdvertising()
        }
    }
}


