//
//  Extensions.swift
//  Sortable
//
//  Created by Mendy Edri on 22/05/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

extension Array where Element == Sortable? {
    var type: SortingTypes {
        if let _ = self.first??.score.doubleValue {
            return .Double
        } else if let _ = self.first??.score.boolValue {
            return .Boolean
        } else if let _ = self.first??.score.dateValue {
            return .Date
        }
        return .none
    }
}

extension Array where Element: Sortable {
    func sort(_ order: ScoreOrder) -> [Element] {
        return Sorter.sort(elements: self, by: order) as! [Element]
    }
    
    /** changes the scores in array of Sortable. closure returns the sortable
     object and an index so you will return the right score - could be based on the element or the index */
    mutating func scores(_ change: (Element, Int) -> (Score)) {
        for (index, sortable) in self.enumerated() {
            var e = Element(sortable)
            e.score = change(sortable, index)
            self[index] = e
        }
    }
}
