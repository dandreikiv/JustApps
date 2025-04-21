import SwiftUI

// MARK: - Views
struct ContentView: View {
    @State var viewModel = AppsViewModel()

    var body: some View {
        NavigationView {
            switch viewModel.viewState {
                case .loading:
                    LoadingView()
                case .loaded(let markets):
                    MarketsView()
                case .idle:
                    Text("prepare")
                case .failed(let message):
                    Text(message)
            }
        }
    }
}

#Preview {
    ContentView()
}
