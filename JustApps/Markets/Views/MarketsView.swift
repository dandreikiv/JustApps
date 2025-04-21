import SwiftUI

struct MarketsView: View {
    private let markets: [Market]

    init(markets: [Market]) {
        self.markets = markets
    }

    var body: some View {
        List(markets, id: \.market) { market in
            NavigationLink(destination: GamesView(games: market.games)) {
                Text(market.market)
            }
        }
    }
}

#Preview {
    MarketsView(
        markets: [
            Market(
                market: "us",
                statusMessage: [:],
                playGamesTitle: [:],
                games: []
            ),
        ]
    )
}
