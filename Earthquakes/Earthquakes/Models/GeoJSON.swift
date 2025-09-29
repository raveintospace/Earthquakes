//
//  GeoJSON.swift
//  Earthquakes
//
//  Created by Uri on 27/9/25.
//

import Foundation

struct GeoJSON: Decodable {
    
    // Tells the decoder which keys of the api we want to decode
    private enum RootCodingKeys: String, CodingKey {
        case features
    }
    
    private enum FeatureCodingKeys: String, CodingKey {
        case properties
    }
    
    // private(set) = only read outside the class
    private(set) var quakes: [Quake] = []
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        
        // Extracts quakes, one at a time
        var featuresContainer = try rootContainer.nestedUnkeyedContainer(forKey: .features)
        
        while !featuresContainer.isAtEnd {
            let propertiesContainer = try featuresContainer.nestedContainer(keyedBy: FeatureCodingKeys.self)
            
            if let properties = try? propertiesContainer.decode(Quake.self, forKey: .properties) {
                quakes.append(properties)
            }
        }
    }
}

/*
 Json -> Features > Properties > [Quake] >magnitude, place, features, code
 featuresContainer extracts quakes, one at a time. The decoder accesses the elements chronologically.
*/
