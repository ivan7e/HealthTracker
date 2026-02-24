
import Foundation
import Combine
import HealthKit

class HealthKitManager {
    static let shared = HealthKitManager()
    
    private init() {}
    
    let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
    let heartRateUnit = HKUnit(from: "count/min") // BPNs
    let healthStore = HKHealthStore()
    var isHealthKitIsAvailable: Bool {
        HKHealthStore.isHealthDataAvailable()
        
    }
    
    func requestAuthorization() async throws {
        let typesToRead: Set<HKObjectType> = [heartRateType]
        let typesTowrite:Set<HKSampleType> = []
        
        try await healthStore.requestAuthorization(toShare:typesTowrite, read: typesToRead)
    }
    
    func checkAuthorizationStatus() -> HKAuthorizationStatus {
        healthStore.authorizationStatus(for: heartRateType)
    }
        
    
// Quary
func fetchLatestHeartRate() async throws -> Double? {
    return try await withCheckedThrowingContinuation { continuation in
        let sortDescriptor = NSSortDescriptor(
            key: HKSampleSortIdentifierStartDate,
            ascending: false)
    
    
    let query = HKSampleQuery(
        sampleType: heartRateType,
        predicate: nil,
        limit: 1,
        sortDescriptors: [sortDescriptor])
        {quaery, samples, error in
            
            if let error = error {
                continuation.resume(throwing: error)
            }
            
            guard let sample = samples?.first as? HKQuantitySample else {
                    continuation.resume(returning: 0)
                    return
            }
            let bpm = sample.quantity.doubleValue(for: self.heartRateUnit)
            continuation.resume(returning: bpm)
            }
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
    
}

