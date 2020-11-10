//
//  TelescopeController.swift
//  Telescope Control
//
//  Created by Enrico Bertolotti on 09/11/2020.
//

import SwiftUI
import Foundation

class TelescopeController: ObservableObject, Identifiable {
    
    // TODO: - Fix random assignment
    var id: UUID = UUID()
    
    var friendlyName: String?
    var rssi: Float?
    
    
    
    init() {
        self.friendlyName = "Unknown Controller"
    }
    
    init(called friendlyName: String, signalStrength: Float? = nil){
        self.friendlyName = friendlyName
        self.rssi = signalStrength
    }
    
//    // TODO: - Cleanup this code
//    var rssiString: String {
//        if let rssi = self.rssi {
//            return String(rssi)
//        }
//        else {
//            return "Unknown Connection Strength"
//        }
//    }
//
    
    // Control parameters
    var currentPos: Int = 0
    var currentRotationRate: Float = 0      // In degrees per second

}
