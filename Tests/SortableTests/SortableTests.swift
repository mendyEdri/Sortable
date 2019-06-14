import XCTest
@testable import Sortable

final class SortableTests: XCTestCase {
 
    func testBoolSorting() {
        let nonSorted = createArrayOfModels()
        var sorted = nonSorted.sort(.descending)
        
        XCTAssertTrue(sorted.first?.score.boolValue ?? false)
        XCTAssertFalse(sorted.last?.score.boolValue ?? true)
        
        
        sorted = nonSorted.sort(.ascending)
        
        XCTAssertFalse(sorted.first?.score.boolValue ?? true)
        XCTAssertTrue(sorted.last?.score.boolValue ?? false)
    }
    
    func testDoubleSorting() {
        let nonSorted = createArrayOfDoubleScoreModes()
        var sorted = nonSorted.sort(.descending)
        
        
        XCTAssertTrue(sorted.first?.score.doubleValue == 1000.0)
        XCTAssertTrue(sorted.last?.score.doubleValue == 0.0)
        
        sorted = nonSorted.sort(.ascending)
        
        XCTAssertTrue(sorted.first?.score.doubleValue == 0.0)
        XCTAssertTrue(sorted.last?.score.doubleValue == 1000.0)
    }
    
    func testDateSorting() {
        let notSorted = createArrayOfDateScoreModes()
        var sorted = notSorted.sort(.ascending)
        XCTAssertLessThan(sorted[0].score.dateValue!, sorted[1].score.dateValue!)
        
        sorted = notSorted.sort(.descending)
        XCTAssertGreaterThan(sorted[0].score.dateValue!, sorted[1].score.dateValue!)
    }
    
    func testEdgeCased() {
        let nonSorted: [TestModel] = []
        let sorted = nonSorted.sort(.descending)
        
        XCTAssertTrue(sorted.first == nil)
    }
    
    static var allTests = [
        ("testBoolSorting", testBoolSorting),
        ("testDoubleSorting", testDoubleSorting),
        ("testDateSorting", testDateSorting),
        ("testEdgeCased", testEdgeCased)
    ]
}

struct TestModel: Sortable {
    var score: Score
}

func createArrayOfDoubleScoreModes() -> [TestModel] {
    var results: [TestModel] = []
    for n in 0...1000 {
        let model = TestModel(score: Score(Double(n)))
        results.append(model)
    }
    return results
}

func createArrayOfDateScoreModes() -> [TestModel] {
    var results: [TestModel] = []
    for n in 0...1000 {
        let date = Date.init(timeIntervalSinceNow: Double(n))
        let model = TestModel(score: Score(date))
        results.append(model)
    }
    return results
}

func createArrayOfModels() -> [TestModel] {
    var results: [TestModel] = []
    for n in 0...1000 {
        let bool = n % 2 == 0
        let model = TestModel(score: Score(bool))
        results.append(model)
    }
    return results
}
