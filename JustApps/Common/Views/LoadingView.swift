import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text("Loading...")
                .padding(.top, 8)
        }
    }
}

#Preview {
    LoadingView()
}
