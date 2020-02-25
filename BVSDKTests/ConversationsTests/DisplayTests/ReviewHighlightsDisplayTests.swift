//
//  ReviewHighlightsDisplayTests.swift
//  BVSDK
//
//  Copyright © 2020 Bazaarvoice. All rights reserved.
//

/*
 Test case Scenarios:
 
 Both Pros and Cons are returned for a valid productId and clientId.
 Only Pros are returned and no Cons are returned for a valid productId and clientId.
 Only Cons are returned and no Pros are returned for a valid productId and clientId.
 No Pros and Cons are returned for a valid productId and clientId (Review count < 10, Excluding incentivised reviews review count < 10).
 The given productId is invalid. In this case a specific error should be returned.
 The given clientId is invalid. In this case a specific error should be returned.
 The clientId does not have RH enabled. In this case a specific error should be returned.
 Pros & Cons should not be mismatched.
 The sequence of the Pros and Cons should be the same as return in Response.
 */

import XCTest
@testable import BVSDK

class ReviewHighlightsDisplayTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let configDict = ["clientId": "hibbett"];
        BVSDKManager.configure(withConfiguration: configDict, configType: .staging)
        BVSDKManager.shared().setLogLevel(.verbose)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Both Pros and Cons are returned for a valid productId and clientId.
    func testProsAndCons() {
        
        let expectation = self.expectation(description: "testProsAndCons")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //Only Pros are returned and no Cons are returned for a valid productId and clientId.
    func testOnlyProsAndNoCons() {
        
        let expectation = self.expectation(description: "testOnlyProsAndNoCons")
        
        let request = BVReviewHighlightsRequest(productId: "5068ZW")
        request.load({ (response) in
            
            
            XCTAssertNotNil(response.reviewHighlights)
            XCTAssertNotNil(response.reviewHighlights.positives)
            
            if let positives = response.reviewHighlights.positives {
                XCTAssertFalse(positives.isEmpty)
            }
            
            XCTAssertNotNil(response.reviewHighlights.negatives)
            
            if let negatives = response.reviewHighlights.negatives {
                XCTAssertTrue(negatives.isEmpty)
            }
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //Only Cons are returned and no Pros are returned for a valid productId and clientId.
    func testOnlyConsAndNoPros() {
        
        let expectation = self.expectation(description: "testOnlyConsAndNoPros")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
    }
    
    //No Pros and Cons are returned for a valid productId and clientId (Review count < 10, Excluding incentivised reviews review count < 10).
    func testNoProsAndCons() {
        
        let expectation = self.expectation(description: "testNoProsAndCons")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //The given productId is invalid. In this case a specific error should be returned.
    func testInvalidProductId() {
        
        let expectation = self.expectation(description: "testInvalidProductId")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //The given clientId is invalid. In this case a specific error should be returned.
    func testInvalidClientId() {
        
        let expectation = self.expectation(description: "testInvalidClientId")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //The clientId does not have RH enabled. In this case a specific error should be returned.
    func testReviewHighlightsNotEnabled() {
        
        let expectation = self.expectation(description: "testReviewHighlightsNotEnabled")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //Pros & Cons should not be mismatched.
    func testProsAndConsNotMismatched() {
        
        let expectation = self.expectation(description: "testProsAndConsNotMismatched")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
    //The sequence of the Pros and Cons should be the same as return in Response.
    func testProsAndConsSequence() {
        
        let expectation = self.expectation(description: "testProsAndConsSequence")
        
        let request = BVReviewHighlightsRequest(productId: "")
        request.load({ (response) in
            
            expectation.fulfill()
            
        }) { (error) in
            
            XCTFail("Profile display request error: \(error)")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Something went horribly wrong, request took too long.")
        }
        
    }
    
}
