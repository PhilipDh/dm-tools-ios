import Foundation
import Combine

class NPCViewModel: ObservableObject {
    @Published var currentNPC: NPC?
    @Published var npcData: NPCData?
    @Published private(set) var loadingState: LoadingState = .idle
    
    var generator: NPCGenerator?
    
    let dataURL = "https://raw.githubusercontent.com/PhilipDh/csvfiles/refs/heads/main/data.json"
    
    enum LoadingState {
        case idle
        case loading
        case loaded
        case error(String)
    }
    
    init() {
        loadData()
    }
    
    private func loadData() {
        loadingState = .loading
        guard let url = URL(string: dataURL) else {
            loadingState = .error("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                DispatchQueue.main.async {
                    self.loadingState = .error(error.localizedDescription)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.loadingState = .error("No data received")
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(NPCData.self, from: data)
                DispatchQueue.main.async {
                    self.npcData = decodedData
                    self.generator = NPCGenerator(data: decodedData)
                    self.loadingState = .loaded
                }
            } catch {
                DispatchQueue.main.async {
                    self.loadingState = .error("Error decoding data: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func retryLoading() {
        loadData()
    }
}
