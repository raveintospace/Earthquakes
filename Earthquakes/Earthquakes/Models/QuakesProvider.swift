//
//  QuakesProvider.swift
//  Earthquakes
//  A class to fetch data from the remote server and save it to the Core Data store
//  Created by Uri on 28/9/25.
//

import SwiftUI
import Observation

@Observable
class QuakesProvider {
    
    var quakes: [Quake] = []
    
    let client: QuakeClient
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
    
    func fetchQuackes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }
    
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }
}
