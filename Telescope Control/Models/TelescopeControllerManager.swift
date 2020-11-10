//
//  TelescopeControllerManager.swift
//  Telescope Control
//
//  Created by Enrico Bertolotti on 09/11/2020.
//

import Foundation

let dummyControllers: [TelescopeController] = [
    TelescopeController(called: "Sofias First Controller", signalStrength: -40.0),
    TelescopeController(called: "Sofias Second Controller")
]

class TelescopeControllerManager: ObservableObject {
    
    @Published var telescopeControllers: [TelescopeController]
    
    init() {
        // This is demo code, remove
        self.telescopeControllers = dummyControllers
    }
}
