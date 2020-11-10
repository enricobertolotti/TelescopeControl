//
//  ControllerDetailView.swift
//  Telescope Control
//
//  Created by Enrico Bertolotti on 09/11/2020.
//

import SwiftUI

private var telescopeController: TelescopeController = TelescopeController(called: "Test")

struct ControllerDetailView: View {
    
//    @EnvironmentObject var telescopeControllerManager: TelescopeControllerManager
    @EnvironmentObject var bluetoothManager: BLEManager
    
    var telescopeControllerUUID: UUID
    
    func getControllerIndex(by id: UUID) -> Int{
        for index in 0..<bluetoothManager.bluetoothDevices.count {
            if bluetoothManager.bluetoothDevices[index].id == id {
                return index
            }
            
        }
        return 0
    }
    
    
    
    var body: some View {
        
        let controllerIndex = getControllerIndex(by: telescopeControllerUUID)
        let friendlyName: String = bluetoothManager.bluetoothDevices[controllerIndex].friendlyName ?? "No Name"
        
        Text(friendlyName)
            .navigationBarTitle(friendlyName)
    }
}
