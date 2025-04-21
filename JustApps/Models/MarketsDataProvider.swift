import Foundation

enum DataLoaderError: Error {
    case invalidURL
    case decodingFailed
    case unknown
}

actor MarketsDataProvider: DataProvider {
    func fetchData<T: Codable>() async throws -> T {
        throw DataLoaderError.unknown
        guard let url = URL(string: "https://jp-fallback.s3.us-east-2.amazonaws.com/fallback.json") else {
            throw DataLoaderError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch _ as DecodingError {
            throw DataLoaderError.decodingFailed
        } catch {
            throw DataLoaderError.unknown
        }
    }
}
