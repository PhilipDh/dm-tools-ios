import SwiftUI

struct GenerateButtonView: View {
    @ObservedObject var viewModel: NPCViewModel
    
    var body: some View {
        Button(action: {
            viewModel.generateNPC()
        }) {
            HStack {
                Text("Generate")
                Text("🛠")
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color(hex: "2c3548"))
            .foregroundColor(.white)
            .cornerRadius(4)
        }
        .padding(.top, 32)
    }
}
