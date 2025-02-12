import XCTest
@testable import jlp_ios_engineer_test

class HelpersTests: XCTestCase {
    
    
    func testCurrecyUSD_shourldReturnValid$() {
       let currency = Help.with.currencySymbol(code: "USD")
        XCTAssertEqual("$", currency)
        }
    
    func testCurrecyJPY_shourldReturnValid() {
       let currency = Help.with.currencySymbol(code: "JPY")
        XCTAssertEqual("¥", currency)
        }
    
    func testCurrecyCNY_shourldReturnValid() {
       let currency = Help.with.currencySymbol(code: "CNY")
        XCTAssertEqual("¥", currency)
        }
    
    func testCurrecyCAD_shourldReturnValid$() {
       let currency = Help.with.currencySymbol(code: "CAD")
        XCTAssertEqual("$", currency)
        }
    
    func testCurrecyUAH_shourldReturnValid₴() {
       let currency = Help.with.currencySymbol(code: "UAH")
        XCTAssertEqual("₴", currency)
        }
    
    func testCurrecyKRW_shourldReturnValid₩() {
       let currency = Help.with.currencySymbol(code: "KRW")
        XCTAssertEqual("₩", currency)
        }

    func testCurrecyZAR_shourldReturnValidR() {
       let currency = Help.with.currencySymbol(code: "ZAR")
        XCTAssertEqual("R", currency)
        }

    func testCurrecyEUR_shourldReturnValid€() {
       let currency = Help.with.currencySymbol(code: "EUR")
        XCTAssertEqual("€", currency)
        }

    }


