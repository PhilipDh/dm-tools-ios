import SwiftUI

struct FlowLayout: Layout {
    let spacing: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        return arrangeSubviews(sizes: sizes, proposal: proposal).size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let result = arrangeSubviews(sizes: sizes, proposal: ProposedViewSize(width: bounds.width, height: nil))
        
        for (index, subview) in subviews.enumerated() {
            let offset = result.offsets[index]
            let rowOffset = result.rowOffsets[offset.y] ?? 0  // Safely unwrap with default value of 0
            let adjustedX = bounds.minX + offset.x + rowOffset
            subview.place(at: CGPoint(x: adjustedX, y: bounds.minY + offset.y), proposal: .unspecified)
        }
    }
    
    private func arrangeSubviews(sizes: [CGSize], proposal: ProposedViewSize) -> (offsets: [CGPoint], rowOffsets: [CGFloat: CGFloat], size: CGSize) {
        guard let maxWidth = proposal.width else {
            return ([], [:], .zero)
        }
        
        var offsets: [CGPoint] = []
        var currentPosition = CGPoint.zero
        var maxY: CGFloat = 0
        var rowWidths: [CGFloat: CGFloat] = [:]
        var currentRowItems: [CGSize] = []
        var rowY: CGFloat = 0
        
        // Calculate positions and collect items per row
        for size in sizes {
            if currentPosition.x + size.width > maxWidth && currentPosition.x > 0 {
                // Store the total width for the completed row
                rowWidths[rowY] = currentPosition.x - spacing
                
                // Move to next row
                currentPosition.x = 0
                currentPosition.y = maxY + spacing
                rowY = currentPosition.y
                currentRowItems = []
            }
            
            offsets.append(currentPosition)
            currentRowItems.append(size)
            
            currentPosition.x += size.width + spacing
            maxY = max(maxY, currentPosition.y + size.height)
        }
        
        // Don't forget to store the last row's width
        if !currentRowItems.isEmpty {
            rowWidths[rowY] = currentPosition.x - spacing
        }
        
        // Calculate centering offsets for each row
        var rowOffsets: [CGFloat: CGFloat] = [:]
        for (y, rowWidth) in rowWidths {
            rowOffsets[y] = (maxWidth - rowWidth) / 2
        }
        
        return (offsets, rowOffsets, CGSize(width: maxWidth, height: maxY))
    }
}
