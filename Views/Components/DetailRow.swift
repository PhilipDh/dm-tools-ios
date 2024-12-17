import SwiftUI

struct DetailRow: View {
    let label: String
    let value: String
    let onReroll: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // Label part with reroll button
            HStack(spacing: 4) {
                Text(label)
                    .foregroundColor(Color(hex: "64b5f6"))
                    .frame(width: 100, alignment: .leading)
                
                Text("⟳")
                    .foregroundColor(Color(hex: "64b5f6"))
                    .opacity(0.0)
                    .scaleEffect(0.8)
            }
            .onTapGesture(perform: onReroll)
            .contentShape(Rectangle())
            
            // Value part
            Text(value)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
        .frame(minHeight: 44) // Minimum height to prevent small content shifts
    }
}

// Preview provider for testing
struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DetailRow(label: "Name:", value: "Test Name") {}
            DetailRow(label: "Hair:", value: "Long, Wavy, Brown") {}
            DetailRow(label: "Special Features:", value: "A very long description that should wrap to multiple lines") {}
        }
        .padding()
        .background(Color(hex: "2c3548"))
        .previewLayout(.sizeThatFits)
    }
}
