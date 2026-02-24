

import Foundation
import Combine
// Service to fetch quotes from Zen API
//
class MotivationalQuotesServices {
    /// Singleton
    static let shared = MotivationalQuotesServices()
    private init () {}
    
    private let apiURL = "https://api.zenquotes.io/v1/random"
    
    //Mark: - FallBack Quotes
    // Design Principle: Offline-first - always available
    private let fallbackQuotes: [String] = [
        "The more we value things, the less we value ourselves. ",
        "Opportunity often comes disguised in the form of misfortune or temporary defeat",
        "Man should fear never beginning to live."    ]
    
    func fetchQuote() async -> String {
        guard let url = URL(string: apiURL) else {
                return fallbackQuotes.randomElement() ?? fallbackQuotes[0]
                
    }
        
    
    
    do{
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode([MotivationalQuote.APIResponse].self, from: data)
        
        if let response = response.first {
            return response.q
        }
        
        
    } catch {}
        return fallbackQuotes.randomElement() ?? fallbackQuotes[0]

        
        
        
    
}
    
    
}
