//
//  Quake+Preview.swift
//  Earthquakes
//  Preview for the quake detail view
//  Created by Uri on 28/9/25.
//

import Foundation

extension Quake {
    
    static var preview: Quake {
        var quake = Quake(magnitude: 0.34,
                                  place: "Shakey Acres",
                                  time: Date(timeIntervalSinceNow: -1000),
                                  code: "nc73649170",
                                  detail: URL(string: "https://example.com")!)
        quake.location = QuakeLocation(latitude: 38.809_333_8, longitude: -122.796_836_9)
                return quake
    }
}
