//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by Uri on 26/9/25.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    
    @State var quakesProvider = QuakesProvider()
    
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environment(quakesProvider)
        }
    }
}
