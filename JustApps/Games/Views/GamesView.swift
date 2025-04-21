import SwiftUI

struct GamesView: View {
    private let viewModels: [GameViewModel]

    init(games: [Game]) {
        self.viewModels = games.map(GameViewModel.init)
    }

    var body: some View {
        List(viewModels, id: \.name) { viewModel in
            HStack {
                AsyncImage(url: viewModel.iconURL) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 50, height: 50)
                .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text(viewModel.name)
                        .font(.title2)
                    Text(viewModel.description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    let game = Game(
        id: 123,
        applicationId: "",
        name: ["default": "Mix Blox"],
        description: ["default" : "Make number matches for loyalty coins!"],
        iconFilename: "https://storage.googleapis.com/public-playtime/images/mix_blox_icon.jpg",
        imageFilename: "https://storage.googleapis.com/public-playtime/images/mix_blox_preview.jpg",
        infoTextInstall: ["default" : "Play"],
        iosApplicationId: "id6446891485",
        iosGameUrl: "LaunchMixBlox"
    )

    GamesView(games: [game])
}
