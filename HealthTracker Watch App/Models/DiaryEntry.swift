import Foundation
import Combine

enum EntryType: String, Codable, CaseIterable {
    case calories = "calories"
    case water = "water"
    
    var icon: String {
        switch self {
        case .calories: "flame.fill"
        case .water: "drop.fill"
        }
    }
    
}
    
struct DiaryEntry: Codable, Identifiable {
    let id: UUID
    let type: EntryType
    let value: Double
    let timestamp: Date
    
    init(id: UUID, type: EntryType, value: Double, timestamp: Date) {
        self.id = id
        self.type = type
        self.value = value
        self.timestamp = timestamp
    }
}
