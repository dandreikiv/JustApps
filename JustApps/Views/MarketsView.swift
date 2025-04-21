import SwiftUI

struct MarketsView: View {
    private let viewModel: [MarketViewModel]

    init(viewModel: [MarketViewModel]) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel) { market in
            Text(market.name)
        }
    }
}

#Preview {
    MarketsView(
        viewModel: [
            MarketViewModel(name: "us"),
            MarketViewModel(name: "us")
        ]
    )
}
