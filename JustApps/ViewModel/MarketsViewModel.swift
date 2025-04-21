import Foundation

@Observable
final class MarketsViewModel {
    // MARK: - Private
    private let dataLoader: any DataLoader

    // MARK: - Observable
    var viewState: ViewState = .idle

    init(dataLoader: any DataLoader)  {
        self.dataLoader = dataLoader
    }

    convenience init() {
        self.init(dataLoader: MarketsDataLoader())
    }

    func loadData() async {
        do {
            let marketsData = try await dataLoader.fetchData()
        } catch {
            
        }
    }
}

extension MarketsViewModel {
    enum ViewState {
        case idle
        case loading
        case loaded([Market])
        case error(Error)
    }
}
