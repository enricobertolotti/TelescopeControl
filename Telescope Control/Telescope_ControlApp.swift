//
//  Telescope_ControlApp.swift
//  Telescope Control
//
//  Created by Enrico Bertolotti on 09/11/2020.
//

import SwiftUI

@main
struct Telescope_ControlApp: App {
    
    
    
    var body: some Scene {
        WindowGroup {
            ControllerListView()
                .environmentObject(TelescopeControllerManager())
                .environmentObject(BLEManager())
        }
    }
}

struct Telescope_ControlApp_Previews: PreviewProvider {
    static var previews: some View {
        ControllerListView()
            .environmentObject(TelescopeControllerManager())
            .colorScheme(.dark)
    }
}
