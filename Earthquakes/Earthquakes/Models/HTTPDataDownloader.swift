//
//  HTTPDataDownloader.swift
//  Earthquakes
//
//  Created by Uri on 27/9/25.
//

import Foundation

// Sendable allows a safely concurrency
protocol HTTPDataDownloader: Sendable {
    func httpData(from: URL) async throws -> Data
}

let validStatus = 200...299

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw QuakeError.networkError
        }
        return data
    }
}
