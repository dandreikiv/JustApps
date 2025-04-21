import SwiftUI

// MARK: - Views
struct ContentView: View {
    @State var viewModel = AppsViewModel()

    var body: some View {
        NavigationStack {
            switch viewModel.viewState {
                case .idle:
                    Button("Fetch markets data") {
                        Task { await viewModel.loadData() }
                    }.buttonStyle(.borderedProminent)

                case .loading:
                    LoadingView()

                case .loaded(let viewModel):
                    MarketsView(markets: viewModel)
                        .navigationTitle("Markets")

                case .failed(let viewModel):
                    LoadingFailedView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
