import Foundation

protocol DataProvider {
    func fetchData<T: Codable>() async throws -> T
}
