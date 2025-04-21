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
            viewState = .loaded(marketsData.filteredMarkets)
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
    var filteredMarkets: [Market] {
        markets.compactMap { market in
            if market.market.contains("-test") || market.market.contains("-staging") {
                return nil
            }
            return market
        }
    }
}

extension AppsViewModel {
    enum ViewState {
        case idle
        case loading
        case loaded([Market])
        case failed(FailureViewModel)
    }
}
