import SwiftUI

struct RaceButton: View {
    let race: Race
    @ObservedObject var viewModel: NPCViewModel
    
    var body: some View {
        Button(action: {
            viewModel.generateNPC(for: race)
        }) {
            Text(race.name)
                .foregroundColor(Color(hex: "64b5f6"))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(hex: "2c3548"))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(hex: "64b5f6"), lineWidth: 1)
                )
        }
    }
}
