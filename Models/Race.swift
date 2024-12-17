import Foundation

struct Race: Codable, Identifiable {
    let name: String
    let names: GenderNames
    let surnames: [String]
    let nicknames: [String]
    let ageRange: Range
    let heightRange: Range
    
    var id: String { name }
}

struct GenderNames: Codable {
    let male: [String]
    let female: [String]
}

struct Range: Codable {
    let min: Double
    let max: Double
}
