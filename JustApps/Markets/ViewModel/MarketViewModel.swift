import Foundation

struct MarketViewModel: Identifiable {
    private let market: Market

    init(market: Market) {
        self.market = market
    }

    // MARK: Identifiable
    let id = UUID()

    // MARK: Public
    var name: String {
        market.market
    }

    var games: [Game] {
        market.games
    }
}
