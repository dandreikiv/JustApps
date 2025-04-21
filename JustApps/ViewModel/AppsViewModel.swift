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
        do {
            let marketsData: MarketsData = try await dataLoader.fetchData()
            viewState = .loaded(marketsData.markets)
        } catch {
            
        }
    }
}

extension AppsViewModel {
    enum ViewState {
        case idle
        case loading
        case loaded([Market])
        case failed(String)
    }
}
