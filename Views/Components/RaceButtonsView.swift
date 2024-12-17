import SwiftUI

struct RaceButtonsView: View {
    @ObservedObject var viewModel: NPCViewModel
    
    var body: some View {
        FlowLayout(spacing: 8) {
            ForEach(viewModel.races) { race in
                RaceButton(race: race, viewModel: viewModel)
            }
        }
    }
}
