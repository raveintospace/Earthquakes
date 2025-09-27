//
//  QuakeClient.swift
//  Earthquakes
//
//  Created by Uri on 27/9/25.
//

import Foundation

struct QuakeClient {
    
    private let downloader: any HTTPDataDownloader
    private let feedURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")!
    
    private var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    // Fetches the earthquakes
    var quakes: [Quake] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let allQuakes = try decoder.decode(GeoJSON.self, from: data)
            return allQuakes.quakes
        }
    }
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}

// https://developer.apple.com/tutorials/app-dev-training/building-a-network-test-client - Section 3
