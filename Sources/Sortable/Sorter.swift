//
//  SortLogic.swift
//  Sortable
//
//  Created by Mendy Edri on 22/05/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import Foundation

/*
 Struct handles the core sort logic of Sortable array
 */

struct Sorter {
    static func sort(elements: [Sortable?], by order: ScoreOrder) -> [Sortable?] {
        var answer: [Sortable?]
        switch elements.type {
        case .Boolean:
            answer = sortByBool(elements, by: order)
        case .Double:
            answer = sortByDouble(elements, by: order)
        case .Date:
            answer = sortDate(elements, by: order)
        case .none:
            print("I can't sort non Sortable array :| please make sure your model object is conform Sortable protocol, or check if the array is empty")
            answer = []
        }
        return answer
    }
    
    private static func sortByBool(_ array: [Sortable?], by order: ScoreOrder) -> [Sortable?] {
        var sorted = array
        for (index, itr) in sorted.enumerated() {
            if itr?.score.boolValue == order.boolValue {
                sorted.remove(at: index)
                sorted.insert(itr, at: 0)
            }
        }
        return sorted
    }
    
    private static func sortByDouble(_ array: [Sortable?], by order: ScoreOrder) -> [Sortable?] {
        let sorted = array.sorted { a, b in
            order == .descending ? a!.score.doubleValue! > b!.score.doubleValue! :
                a!.score.doubleValue! < b!.score.doubleValue!
        }
        
        return sorted
    }
    
    private static func sortDate(_ array: [Sortable?], by order: ScoreOrder) -> [Sortable?] {
        let sorted = array.sorted { a, b in
            order == .descending ? a!.score.dateValue! > b!.score.dateValue! :
                a!.score.dateValue! < b!.score.dateValue!
        }
        return sorted
    }
}

