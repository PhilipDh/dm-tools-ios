import SwiftUI

struct CharacterTraitsGridView: View {
    @ObservedObject var viewModel: NPCViewModel
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ], alignment: .leading, spacing: 16) {
            DetailRow(label: "Special Features:", value: viewModel.currentNPC?.specialFeatures ?? "-") {
                viewModel.rerollProperty(.specialFeatures)
            }
            DetailRow(label: "Personality:", value: viewModel.currentNPC?.personality ?? "-") {
                viewModel.rerollProperty(.personality)
            }
            DetailRow(label: "Job:", value: viewModel.currentNPC?.job ?? "-") {
                viewModel.rerollProperty(.job)
            }
            DetailRow(label: "Quirks:", value: viewModel.currentNPC?.quirks ?? "-") {
                viewModel.rerollProperty(.quirks)
            }
        }
    }
}
