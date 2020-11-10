//
//  ContentView.swift
//  Telescope Control
//
//  Created by Enrico Bertolotti on 09/11/2020.
//

import SwiftUI




struct ControllerListView: View {
    
//    @EnvironmentObject var telescopeControllerManager: TelescopeControllerManager
    @EnvironmentObject var bluetoothManager: BLEManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
//                    bluetoothStatusView()
                    ForEach(bluetoothManager.bluetoothDevices) { telescopeController in
                        NavigationLink(destination: ControllerDetailView(telescopeControllerUUID: telescopeController.id)){
                            controllerCardView(controller: telescopeController)
                        }
                        .foregroundColor(.primary)
                        
                    }.padding(.horizontal)
                }
            }
            .navigationBarTitle(Text("Devices"))
            .navigationBarItems(trailing:
                Button(action: {
                    bluetoothManager.startScanning()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .imageScale(.large)
                })
            )
        }
    }
    
//    func bluetoothStatusView() -> some View {
//
//        ZStack {
//
//            Color(UIColor.systemGray6)
//                .clipShape(Rectangle())
//                .cornerRadius(10)
//
//            HStack {
//                Toggle("Bluetooth is " + (bluetoothManager.isSwitchedOn ? "on" : "off"), isOn: $bluetoothManager.isSwitchedOn)
//                    .padding()
//            }
//        }.padding()
//    }
    
    func controllerCardView(controller: TelescopeController) -> some View {
        ZStack {
            
            Color(UIColor.systemGray6)
                .clipShape(Rectangle())
                .cornerRadius(10)
            
            HStack {
                
                Image(systemName: "bolt.horizontal.circle.fill")
                    .imageScale(.large)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(controller.friendlyName ?? "Unrecognized")
                        .font(Font.headline.bold())
                    
                    Group{
                        if let rssi = controller.rssi {
                            Text("Signal Strength: " + String(rssi) + "dB")
                        } else {
                            Text("Unknown Connection Strength")
                        }
                    }
                        .font(.caption)
                        .opacity(0.6)
                    
                    
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(Font.body.weight(.bold))
                    .padding()
            }
            .padding()
        }
        
        .frame(minHeight: 80)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ControllerListView()
            .environmentObject(TelescopeControllerManager())
            .environmentObject(BLEManager())
            .colorScheme(.light)
    }
}
