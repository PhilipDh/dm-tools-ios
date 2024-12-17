import Foundation

class NPCGenerator {
    private let data: NPCData
    
    init(data: NPCData) {
        self.data = data
    }
    
    func generate(race: Race? = nil) -> NPC {
        let selectedRace = race ?? data.races.randomElement()!
        let gender = Gender.allCases.randomElement()!
        
        let name = generateName(for: selectedRace, gender: gender)
        let age = Int.random(in: Int(selectedRace.ageRange.min)...Int(selectedRace.ageRange.max))
        let height = Double.random(in: selectedRace.heightRange.min...selectedRace.heightRange.max)
        
        return NPC(
            name: name,
            race: selectedRace,
            gender: gender,
            age: age,
            height: height,
            bodyType: data.bodyTypes.randomElement() ?? "",
            hair: generateHairDescription(),
            skin: data.bodyDescriptions.skinComplexions.randomElement() ?? "",
            eyes: data.bodyDescriptions.eyeColors.randomElement() ?? "",
            specialFeatures: data.bodyDescriptions.specialFeatures.randomElement() ?? "",
            personality: data.personalities.randomElement() ?? "",
            job: data.jobs.randomElement() ?? "",
            quirks: data.quirks.randomElement() ?? ""
        )
    }
    
    private func generateName(for race: Race, gender: Gender) -> String {
        let firstName = gender == .male ?
            race.names.male.randomElement()! :
            race.names.female.randomElement()!
        
        let surname = race.surnames.randomElement() ?? ""
        let useNickname = Double.random(in: 0...1) > 0.7
        let randomNickname = race.nicknames.randomElement() ?? ""
        let nickname = useNickname && !randomNickname.isEmpty ? randomNickname : nil
        
        if let nickname = nickname {
            return "\(firstName) \"\(nickname)\" \(surname)"
        }
        return "\(firstName) \(surname)"
    }
    
    private func generateHairDescription() -> String {
        let length = data.bodyDescriptions.hairLengths.randomElement()!
        let type = data.bodyDescriptions.hairTypes.randomElement()!
        let color = data.bodyDescriptions.hairColors.randomElement()!
        return "\(length), \(type), \(color)"
    }
    
    func rerollProperty(for npc: inout NPC, property: NPCProperty) {
        switch property {
        case .name:
            npc.name = generateName(for: npc.race, gender: npc.gender)
        case .race:
            let newRace = data.races.randomElement()!
            npc.race = newRace
            npc.age = Int.random(in: Int(newRace.ageRange.min)...Int(newRace.ageRange.max))
            npc.height = Double.random(in: newRace.heightRange.min...newRace.heightRange.max)
            npc.name = generateName(for: newRace, gender: npc.gender)
        case .gender:
            let newGender = npc.gender == .male ? Gender.female : Gender.male
            npc.gender = newGender
            npc.name = generateName(for: npc.race, gender: newGender)
        case .age:
            npc.age = Int.random(in: Int(npc.race.ageRange.min)...Int(npc.race.ageRange.max))
        case .height:
            npc.height = Double.random(in: npc.race.heightRange.min...npc.race.heightRange.max)
        case .bodyType:
            npc.bodyType = data.bodyTypes.randomElement() ?? ""
        case .hair:
            npc.hair = generateHairDescription()
        case .skin:
            npc.skin = data.bodyDescriptions.skinComplexions.randomElement() ?? ""
        case .eyes:
            npc.eyes = data.bodyDescriptions.eyeColors.randomElement() ?? ""
        case .specialFeatures:
            npc.specialFeatures = data.bodyDescriptions.specialFeatures.randomElement() ?? ""
        case .personality:
            npc.personality = data.personalities.randomElement() ?? ""
        case .job:
            npc.job = data.jobs.randomElement() ?? ""
        case .quirks:
            npc.quirks = data.quirks.randomElement() ?? ""
        }
    }
}
