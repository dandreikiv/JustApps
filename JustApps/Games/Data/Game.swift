import Foundation

struct Game: Codable, Identifiable {
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
