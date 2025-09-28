//
//  QuakeClient.swift
//  Earthquakes
//  A class to fetch and cache data from the remote server
//  Created by Uri on 27/9/25.
//

import Foundation

// Actor protects the cache from simultaneous access from multiple threads (when fetching locations)
actor QuakeClient {
    
    private let downloader: any HTTPDataDownloader
    private let feedURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")!
    private let quakeCache: NSCache<NSString, CacheEntryObject> = NSCache()
    
    private var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    /// Fetches the earthquakes
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
    
    /// Fetches and decodes the location
    func quakeLocation(from url: URL) async throws -> QuakeLocation {
        if let cached = await quakeCache[url] {
            switch cached {
            case .ready(let location):
                return location
            case .inProgress(let task):         // avoids making a second network request
                return try await task.value
            }
        }
        let task = Task<QuakeLocation, Error> {
            let data = try await downloader.httpData(from: url)
            let location = try decoder.decode(QuakeLocation.self, from: data)
            return location
        }
        quakeCache[url] = .inProgress(task)
        do {
            let location = try await task.value
            quakeCache[url] = .ready(location)
            return location
        } catch {
            quakeCache[url] = nil
            throw error
        }
    }
}
