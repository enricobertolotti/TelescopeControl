//
//  BLEManager.swift
//  Telescope Control
//
//  Created by Enrico Bertolotti on 09/11/2020.
//

import Foundation
import CoreBluetooth
 
class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
 
    var bluetoothCentral: CBCentralManager!
 
    @Published var isSwitchedOn = false
        
    @Published var bluetoothDevices = [TelescopeController]()
    
    override init() {
        super.init()
 
        bluetoothCentral = CBCentralManager(delegate: self, queue: nil)
        bluetoothCentral.delegate = self
    }
 
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
        }
        else {
            isSwitchedOn = false
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        var controllerName: String
       
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            controllerName = name
        }
        else {
            controllerName = "Unknown"
        }
       
        let newController = TelescopeController(called: controllerName, signalStrength: RSSI.floatValue)
        print(newController)
        bluetoothDevices.append(newController)
    }
    
    func startScanning() {
            print("startScanning")
            bluetoothCentral.scanForPeripherals(withServices: nil, options: nil)
            DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
                self.stopScanning()
            }
    }
    
    func stopScanning() {
            print("stopScanning")
            bluetoothCentral.stopScan()
    }
 
}
