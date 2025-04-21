import Foundation

protocol DataLoader {
    associatedtype ReturnType: Codable
    func fetchData() async throws -> ReturnType
}
