
import XCTest
@testable import jlp_ios_engineer_test

class ProductViewModelTests: XCTestCase {
    
   let viewModel = ProductsViewModel()
    
    func testEmptyImageURL_shourldReturnPlaceholder() {
        viewModel.loadImage(from: "wrog url") { image in
            XCTAssertEqual(image.debugDescription, "Placeholder.jpg")
        }
    }
    func testEmptyImageURL_shourldReturnValidImage() {
        viewModel.loadImage(from: "https://picsum.photos/200") { image in
            XCTAssertEqual(image.debugDescription, "https://picsum.photos/200")
        }
    }
}

