//
//  SolarSystemApp.swift
//  SolarSystem
//
//  Created by Raul Dozal on 6/12/26.
//

import SwiftUI

@main
struct SolarSystemApp: App {
    // @StateObject creates and holds the instance and environment object
    @StateObject var solarSystem = SolarSystemViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(solarSystem)
        }
    }
}
