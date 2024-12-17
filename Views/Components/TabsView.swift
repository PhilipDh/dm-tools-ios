import SwiftUI

struct TabsView: View {
    var body: some View {
        HStack {
            Text("NPC Generator")
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color(hex: "64b5f6")),
                    alignment: .bottom
                )
            Spacer()
        }
        .background(Color(hex: "2c3548"))
    }
}
