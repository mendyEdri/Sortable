//
//  Sortable.swift
//  Sortable
//
//  Created by Mendy Edri on 13/05/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation


/* Guidlines: Make sorting with this types:
 * Boolean (sort first/last if object set the booleans as true)
 * Int (sort first/last by sorting the score of each object)
 */

enum SortingTypes {
    case Double
    case Boolean
    case Date
    case none
}

struct Score {
    var doubleValue: Double?
    var boolValue: Bool?
    var dateValue: Date?
    
    init(_ score: Bool) {
        self.boolValue = score
    }
    
    init(_ score: Double) {
        self.doubleValue = score
    }
    
    init (_ score: Date) {
        self.dateValue = score
    }
}

// Sortable
protocol Sortable {
    var score: Score { get set }
}

extension Sortable {
    init(_ sortable: Self) {
        self = sortable
    }
}

public enum ScoreOrder {
    case descending
    case ascending
    
    var boolValue: Bool {
        if self == .ascending { return false }
        return true
    }
}
