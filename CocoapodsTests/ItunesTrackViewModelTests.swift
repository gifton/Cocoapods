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
    var loader: APILoader<LoginAPI>!
    let predicate = "Drake"
    
    func setup() {
        sut = ItunesTrackViewModel()
        
        let request = LoginAPI()
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        loader = APILoader(apiRequest: request, urlSession: urlSession)
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
    
    func testDoesCreateResponse() {
        let service = TrackListService()
        
        service.mockGetTracks(completion: { (tracks, err) in
            XCTAssertNotNil(tracks)
        })
    }
    
    func testTrackServiceCallsGET() {
        let service = TrackListService()
        
        service.mockGetTracks(completion: { (tracks, err) in
            guard let artist = tracks.first?.artist else { XCTFail(); return }
            XCTAssertEqual(artist, "Led Zeppelin")
        })
        
    }
    
    func testGetTracksSuccess() {
        let expectation = XCTestExpectation(description: "response")
        
        loader.loadAPIRequest(requestData: params) { result, error in
            
            if let result = result {
                guard let artist = tracks.first?.artist else { XCTFail(); return }
                XCTAssertEqual(artist, "Led Zeppelin")
                expectation.fulfill()
            } else {
                XCTFail()
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    
    func testRecievePayloadFromEndpoint() {
        
    }
}

class URLSessionMock: URLSession {
    
}

