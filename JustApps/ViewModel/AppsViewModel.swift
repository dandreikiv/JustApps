import Foundation

@Observable
final class AppsViewModel {
    // MARK: - Private
    private let dataLoader: any DataProvider

    // MARK: - Observable
    var viewState: ViewState = .idle

    init(dataLoader: any DataProvider)  {
        self.dataLoader = dataLoader
    }

    convenience init() {
        self.init(dataLoader: MarketsDataProvider())
    }

    func loadData() async {
        viewState = .loading

        do {
            let marketsData: MarketsData = try await dataLoader.fetchData()
            viewState = .loaded(marketsData.marketViewModels)
        } catch {
            viewState = .failed(
                FailureViewModel(
                    title: "Something went wrong",
                    subtitle: "Please try again later."
                )
            )
        }
    }
}

private extension MarketsData {
    var marketViewModels: [MarketViewModel] {
        markets.compactMap { market in
            if market.market.contains("-test") || market.market.contains("-staging") {
                return nil
            }
            return MarketViewModel(name: market.market)
        }
    }
}

extension AppsViewModel {
    enum ViewState {
        case idle
        case loading
        case loaded([MarketViewModel])
        case failed(FailureViewModel)
    }
}
