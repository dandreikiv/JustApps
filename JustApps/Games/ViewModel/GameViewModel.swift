import Foundation

struct GameViewModel {
    private let game: Game

    init(game: Game) {
        self.game = game
    }

    var name: String {
        game.name["en"] ?? game.name["default"] ?? ""
    }

    var description: String {
        game.description["en"] ?? game.description["default"] ?? ""
    }

    var iconURL: URL? {
        URL(string: game.imageFilename)
    }
}
