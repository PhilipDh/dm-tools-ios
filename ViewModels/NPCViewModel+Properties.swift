import Foundation

extension NPCViewModel {
    var races: [Race] {
        npcData?.races ?? []
    }
    
    var isDataLoaded: Bool {
        npcData != nil && generator != nil
    }
    
    var formattedHeight: String {
        guard let heightInCm = currentNPC?.height else { return "-" }
        
        return heightInCm >= 100 ?
            String(format: "%.2fm", heightInCm / 100) : // Convert cm to meters (e.g., 192 -> 1.92m)
            String(format: "%.0fcm", heightInCm)        // Keep as cm (e.g., 60 -> 60cm)
    }
    
    var formattedAge: String {
        guard let age = currentNPC?.age else { return "-" }
        return "\(age) Jahre"
    }
}
