//
//  TestDownloader.swift
//  Earthquakes
//  A test class to fake a network connection
//  Created by Uri on 27/9/25.
//

import Foundation

final class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(for: .milliseconds(.random(in: 100...500)))
        return testQuakesData
    }
}
