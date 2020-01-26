import XCTest
@testable import UsefullSDK

final class UsefullSDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UsefullSDK().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
    
    func testInsertArray() {
        var array: [Int] = [1, 2]
        let elementToAdd = 3
        array += elementToAdd
        XCTAssertTrue(array.contains(where: { $0 == elementToAdd }))
    }
    
    func testCGSize() {
        var size = CGSize(width: 2, height: 3)
        let sizeToRemove = CGSize(width: 4, height: 1)
        let valueToRemove = 3
        size -= valueToRemove
    }
    
    func testCells() {
        let exp = XCTestExpectation(description: "TEST")
        let tableView = UITableView(frame: .zero)
        let textData = TextCellData(text: "ASD")
        let textStyle = TextCellStyle(textColor: .red, font: .systemFont(ofSize: 15))
        let textContent = TextCellModule(data: textData, style: textStyle, cell: TextCellViewModel.self)
        let contents = [[textContent]]
        let dataSource = ModulableTableViewDataSource(tableView: tableView, contents: contents)
        tableView.reloadData()
        tableView.dataSource = dataSource
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
                exp.fulfill()
            }
        } else {
            // Fallback on earlier versions
        }
        
        wait(for: [exp], timeout: 10)
    }
}
