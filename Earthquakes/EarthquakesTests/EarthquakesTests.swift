//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Uri on 27/9/25.
//

import Foundation
import Testing
@testable import Earthquakes

struct EarthquakesTests {
    
    @Test func geoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649170)
        #expect(quake.code == "73649170")
        
        let expectedSeconds = TimeInterval(1636129710550 / 1000.0)
        let expectedTime = Date(timeIntervalSince1970: expectedSeconds)
        #expect(quake.time == expectedTime)
    }

}
