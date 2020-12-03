//
//  ItunesTrackViewModelTests.swift
//  CocoapodsTests
//
//  Created by Gifton on 12/1/20.
//  Copyright © 2020 Javier. All rights reserved.
//

import XCTest

@testable import Cocoapods

class ItunesTrackViewModelTests: XCTestCase {

    var sut: ItunesTrackViewModel!
    let predicate = "Drake"
    
    func setup() {
        sut = ItunesTrackViewModel()
    }
    
    
    // url creation
    func testCreateValidUrl() {
        
        sut.search(for: predicate, completionHandler: { (values) in })
        
        XCTAssertTrue(sut.activeUrl == Constants.endpoint + predicate)
    
    }
    
    
    // converting data from json to itunes
    
    func testCreateItunesModelFromJson() {
        var expectedArray = [ItunesTrack]()
        
        sut.search(for: predicate, completionHandler: { (values, error) in
            
        })
        
    }
    
    func testRecievePayloadFromEndpoint() {
        
    }
}

class URLSessionMock: URLSession {
    
}

