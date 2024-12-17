import Foundation

extension NPCViewModel {
    func generateNPC(for race: Race? = nil) {
        guard let generator = generator else { return }
        self.currentNPC = generator.generate(race: race)
    }
    
    func rerollProperty(_ property: NPCProperty) {
        guard var npc = currentNPC, let generator = generator else { return }
        generator.rerollProperty(for: &npc, property: property)
        self.currentNPC = npc
    }
}
