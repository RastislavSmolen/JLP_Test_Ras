//
//  jlp_ios_engineer_testTests.swift
//  jlp-ios-engineer-testTests
//
//  Created by Chris Thomas on 11/05/2022.
//

import XCTest
@testable import jlp_ios_engineer_test

class NetworkManagerTests: XCTestCase {
    
    func testDecodingError_Product() {
        let mockSession = MockURLSession()
        
        // Provide incorrect JSON format (valid JSON, but incorrect for expected model)
        mockSession.mockData = """
        {
            ["invalidKey": "wrong value"]
        }
        """.data(using: .utf8)
        
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: URLPaths.detailViewURL.rawValue())!,
                                                   statusCode: 200,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        mockSession.mockError = nil
        
        let networkManager = NetworkManager(session: mockSession)
        let expectation = self.expectation(description: "Decoding error should occur")
        
        networkManager.request(url: URLPaths.productsPageURL) { (result: Result<Product, APIError>) in
            switch result {
            case .success:
                XCTFail("Test failed: Expected decoding error, but got success.")
            case .failure(let error):
                if case .decodingError = error {
                    expectation.fulfill()
                } else {
                    XCTFail("Test failed: Expected decoding error, but got \(error)")
                }
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testNetworkError_Product() {
        let mockSession = MockURLSession()
        
        // Simulate a network error
        mockSession.mockError = NSError(domain: "NetworkError", code: -1001, userInfo: nil)
        
        let networkManager = NetworkManager(session: mockSession)
        
        let expectation = self.expectation(description: "Network error should occur")
        
        networkManager.request(url: URLPaths.productsPageURL) { (result: Result<Product, APIError>) in
            if case .failure(let error) = result {
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testDecodingError_ProductDetail() {
        let mockSession = MockURLSession()
        
        // Provide incorrect JSON format (valid JSON, but incorrect for expected model)
        mockSession.mockData = """
        {
            ["invalidKey": "wrong value"]
        }
        """.data(using: .utf8)
        
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: URLPaths.productsPageURL.rawValue())!,
                                                   statusCode: 200,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        mockSession.mockError = nil
        
        let networkManager = NetworkManager(session: mockSession)
        let expectation = self.expectation(description: "Decoding error should occur")
        
        networkManager.request(url: URLPaths.detailViewURL) { (result: Result<Product, APIError>) in
            switch result {
            case .success:
                XCTFail("Test failed: Expected decoding error, but got success.")
            case .failure(let error):
                if case .decodingError = error {
                    expectation.fulfill()
                } else {
                    XCTFail("Test failed: Expected decoding error, but got \(error)")
                }
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testNetworkError_ProductDetail() {
        let mockSession = MockURLSession()
        
        // Simulate a network error
        mockSession.mockError = NSError(domain: "NetworkError", code: -1001, userInfo: nil)
        
        let networkManager = NetworkManager(session: mockSession)
        
        let expectation = self.expectation(description: "Network error should occur")
        
        networkManager.request(url: URLPaths.detailViewURL) { (result: Result<Product, APIError>) in
            if case .failure(let error) = result {
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
