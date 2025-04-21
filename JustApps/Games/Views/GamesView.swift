import SwiftUI

struct GamesView: View {
    private let market: Market

    init(market: Market) {
        self.market = market
    }

    var body: some View {
        List(market.games, rowContent: GameView.init)
    }
}

#Preview {
    let game = Game(
        id: 123,
        applicationId: "",
        name: ["default": "Mix Blox"],
        description: ["default" : "Make number matches for loyalty coins!"],
        iconFilename: "https://storage.googleapis.com/public-playtime/images/mix_blox_icon.jpg",
        imageFilename: "https://storage.googleapis.com/public-playtime/images/mix_blox_preview.jpg",
        infoTextInstall: ["default" : "Play"],
        iosApplicationId: "id6446891485",
        iosGameUrl: "LaunchMixBlox"
    )

    GamesView(
        market: Market(
            market: "us",
            statusMessage: [:],
            playGamesTitle: [:],
            games: [game]
        )
    )
}
