//
//  CacheEntryObject.swift
//  Earthquakes
//  A class for catching Quake data
//  Created by Uri on 28/9/25.
//

import Foundation

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}

final class CacheEntryObject {
    let entry: CacheEntry
    
    init(entry: CacheEntry) {
        self.entry = entry
    }
}

/*
 the inProgress enumeration is used to avoid making a second network request for a location that has been requested but not loaded.
 
 NSCache can hold only reference types. To store an enumeration value in the cache, we create a final class that holds the enumeration value, and store it in the cache.
 */
