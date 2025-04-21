import Foundation

struct MarketsData: Codable {
    let markets: [Market]
}

struct Market: Codable {
    let market: String
    let statusMessage: [String: String]
    let playGamesTitle: [String: String]
    let games: [Game]
}
