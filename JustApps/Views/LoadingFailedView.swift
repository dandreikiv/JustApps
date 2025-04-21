import SwiftUI

struct LoadingFailedView: View {
    private let viewModel: FailureViewModel

    init(viewModel: FailureViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)

            Text(viewModel.title)
                .font(.headline)

            Text(viewModel.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }

}

#Preview {
    LoadingFailedView(
        viewModel: FailureViewModel(
            title: "Title",
            subtitle: "Subtitle"
        )
    )
}
