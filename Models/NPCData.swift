import Foundation

struct NPCData: Codable {
    let races: [Race]
    let personalities: [String]
    let bodyDescriptions: BodyDescriptions
    let bodyTypes: [String]
    let jobs: [String]
    let quirks: [String]
}
