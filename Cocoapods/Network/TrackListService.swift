//
//  TrackListService.swift
//  Cocoapods
//
//  Created by Gifton on 12/3/20.
//  Copyright © 2020 Javier. All rights reserved.
//

import Foundation




class ItunesTrackService {
    func getTracks(predicate: String, completion: @escaping ([ItunesTrack]?, Error?) -> ()) {
        let api = TrackListApi()
        let taskLoader = APILoader(apiRequest: api)
        
        taskLoader.loadAPIRequest(requestData: predicate) { (tracks, err) in
            completion(tracks?.tracks, err)
        }
        
    }
    
    
    func mockGetTracks(completion: @escaping ([ItunesTrack]?, Error?) -> ()) {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        let sampleResponse =
        """
        {
            "artistName": "Led Zeppelin",
            "trackName": "Stairway  to Heaven",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music/56/87/1a/mzi.zkguwpha.jpg/100x100bb.jpg"
        },
        {
            "artistName": "Led Zeppelin",
            "trackName": "Immigrant Song",
            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music/56/87/1a/mzi.zkguwpha.jpg/100x100bb.jpg"
        }
        """
        
        let mockJSONData = sampleResponse.data(using: .utf8)!
        // request handler
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockJSONData)
        }
        
        // Request object
        let request = TrackListApi()
        let apiTaskLoader = APILoader(apiRequest: request, urlSession: urlSession)
        apiTaskLoader.loadAPIRequest(requestData: "Led Zeppelin") { (tracks, err) in
            completion(tracks?.tracks, err)
        }
    }
}
