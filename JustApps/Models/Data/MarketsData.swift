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

struct Game: Codable {
    let id: Int
    let applicationId: String
    let name: [String: String]
    let description: [String: String]
    let iconFilename: String
    let imageFilename: String
    let infoTextInstall: [String: String]
    let iosApplicationId: String
    let iosGameUrl: String
}
