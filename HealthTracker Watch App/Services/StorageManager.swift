import Foundation
import Combine

class StorageManager {
    // MARK: - Singleton
    static let shared = StorageManager()
    private init() {}
    
    private enum Keys {
        static let userGoals = "user_goals"
        static let diaryEntries = "diary_entries"
    }
    
    // MARK: - UserDefaults
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - User Goals
    func saveGoals(_ goals: UserGoals) {
        if let enccoded = try? encoder.encode(goals) {
            defaults.set(enccoded, forKey: Keys.userGoals)
        }
    }
    
    func loadGoals() -> UserGoals {
        guard let data = defaults.data(forKey: Keys.userGoals),
              let goals = try? decoder.decode(UserGoals.self, from: data) else {
            return UserGoals.defaultGoals
        }
        
        return goals
    }
    
    func saveEntries(_ entries: [DiaryEntry]) {
        if let encoded = try? encoder.encode(entries) {
            defaults.set(encoded, forKey: Keys.diaryEntries)
            
        }
    }
    func loadEntries()-> [DiaryEntry] {
        guard let data = defaults.data(forKey: Keys.diaryEntries),
              let diaryEntries = try? decoder.decode([DiaryEntry].self, from: data) else {
            return []
            
        }
        return diaryEntries
    }
    
    func addEntryFromUserInput(_entry: DiaryEntry) {
        var entries = loadEntries()
        saveEntries(entries)
    }
    
    func getTodaysEntries() -> [DiaryEntry] {
        let entries = loadEntries()
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        
        
        return entries.filter { entry in
            calendar.isDate(entry.timestamp, inSameDayAs: today)
        }
    }
        
    func getTodaysTotal(for type: EntryType) -> Double {
        getTodaysEntries().filter { $0.type == type }.reduce(0) { $0 + $1.value }
        
    }
        
        
        
        
        


}

// mark diary entries

