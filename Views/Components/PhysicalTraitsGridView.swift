import SwiftUI

struct PhysicalTraitsGridView: View {
    @ObservedObject var viewModel: NPCViewModel
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ], alignment: .leading, spacing: 10) {
            DetailRow(label: "Name:", value: viewModel.currentNPC?.name ?? "-") {
                viewModel.rerollProperty(.name)
            }
            DetailRow(label: "Race:", value: viewModel.currentNPC?.race.name ?? "-") {
                viewModel.rerollProperty(.race)
            }
            DetailRow(label: "Gender:", value: viewModel.currentNPC?.gender.rawValue ?? "-") {
                viewModel.rerollProperty(.gender)
            }
            DetailRow(label: "Age:", value: viewModel.formattedAge) {
                viewModel.rerollProperty(.age)
            }
            DetailRow(label: "Height:", value: viewModel.formattedHeight) {
                viewModel.rerollProperty(.height)
            }
            DetailRow(label: "Body Type:", value: viewModel.currentNPC?.bodyType ?? "-") {
                viewModel.rerollProperty(.bodyType)
            }
            DetailRow(label: "Hair:", value: viewModel.currentNPC?.hair ?? "-") {
                viewModel.rerollProperty(.hair)
            }
            DetailRow(label: "Skin:", value: viewModel.currentNPC?.skin ?? "-") {
                viewModel.rerollProperty(.skin)
            }
            DetailRow(label: "Eyes:", value: viewModel.currentNPC?.eyes ?? "-") {
                viewModel.rerollProperty(.eyes)
            }
        }
    }
}
