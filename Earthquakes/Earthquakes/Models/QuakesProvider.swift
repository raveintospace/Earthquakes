//
//  QuakesProvider.swift
//  Earthquakes
//
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
}
