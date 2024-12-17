import SwiftUI

struct NPCCardView: View {
    @ObservedObject var viewModel: NPCViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Your NPC")
                .font(.title2)
                .foregroundColor(Color(hex: "64b5f6"))
            
            VStack(spacing: 24) {
                PhysicalTraitsGridView(viewModel: viewModel)
                
                Divider()
                    .background(Color(hex: "3c4558"))
                
                CharacterTraitsGridView(viewModel: viewModel)
            }
        }
        .padding(24)
        .background(Color(hex: "2c3548"))
        .cornerRadius(8)
    }
}
