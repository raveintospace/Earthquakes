//
//  QuakeError.swift
//  Earthquakes
//
//  Created by Uri on 26/9/25.
//

import Foundation

enum QuakeError: Error {
    case missingData
    case networkError
    case unexpectedError
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a quake missing a valid code, magnitude, place or time", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching quake data over the network.", comment: "")
        case .unexpectedError:
            return NSLocalizedString("Received unexpected error.", comment: "")
        }
    }
}
