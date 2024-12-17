import Foundation

struct NPC: Identifiable {
    let id = UUID()
    var name: String
    var race: Race
    var gender: Gender
    var age: Int
    var height: Double
    var bodyType: String
    var hair: String
    var skin: String
    var eyes: String
    var specialFeatures: String
    var personality: String
    var job: String
    var quirks: String
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}
