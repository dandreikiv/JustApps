//
//  MarketsDataLoader.swift
//  JustApps
//
//  Created by Dmytro Andreikiv on 21/04/2025.
//

import Foundation

enum DataLoaderError: Error {
    case invalidURL
    case decodingFailed
    case unknown
}

actor MarketsDataLoader: DataLoader {
    func fetchData() async throws(DataLoaderError) -> MarketsData {
        guard let url = URL(string: "https://jp-fallback.s3.us-east-2.amazonaws.com/fallback.json") else {
            throw .invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(MarketsData.self, from: data)
        } catch let decodingError as DecodingError {
            throw .decodingFailed
        } catch {
            throw .unknown
        }
    }
}
