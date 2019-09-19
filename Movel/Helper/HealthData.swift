//
//  HealthData.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import HealthKit

fileprivate enum HealthError: Error {
    case notAvailable,missingType
}

class HealthData {
    var stepCount:Double = 0
    
    init() {
        authorizeHealthKit { (success, error) in
            if success {
                print("Success loading health data")
            }
            else {
                print("Error : \(error.debugDescription)")
            }
        }
    }
    
    private func authorizeHealthKit(completion: @escaping (Bool,Error?) -> Void) {
        
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, HealthError.notAvailable)
            return
        }
        
        guard let steps = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            completion(false,HealthError.missingType)
            return
        }
        
        let write: Set<HKSampleType> = [steps]
        let read: Set<HKObjectType> = [steps]
        
        HKHealthStore().requestAuthorization(toShare: write, read: read, completion: completion)
    }

    func readSteps() {
        let steps = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let date = Date()
        let startOfDay = Calendar.current.startOfDay(for: date)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: date, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                print("Error : \(error.debugDescription) ")
                return
            }
            print("SUM : \(sum.doubleValue(for: .count()))")
            self.stepCount = sum.doubleValue(for: .count())
        }
        HKHealthStore().execute(query)
    }
    
}
