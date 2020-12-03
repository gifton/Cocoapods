//
//  ItunesTrackViewModel.swift
//  Cocoapods
//
//  Created by Gifton on 12/1/20.
//  Copyright © 2020 Javier. All rights reserved.
//



// ViewModel methods
// search URL
// returning a list of Tracks
// end search
//  https://itunes.apple.com/search?term=
import Foundation
import UIKit

// MARK: Itunes TrackViewModel
final class ItunesTrackViewModel: ViewModel, TrackDecodable {
    
    var session: URLSession?
    
    // Equatable conformance
    static func == (lhs: ItunesTrackViewModel, rhs: ItunesTrackViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var uuid: UUID {
        return UUID()
    }
    
    var id: String {
        
        return "TRACKVIEWMODEL"
    }
    
    
    // current query
    var activeUrl: String?
    
    // public track search method
    public func search(for predicate: String, completionHandler: @escaping ([ItunesTrack]?, Error?) -> Void)  {
        
        if !(predicate.count > 0) {
            completionHandler(nil, nil)
            return
        }
        
        guard let url = URL(string: Constants.endpoint + predicate) else { completionHandler(nil, nil); return }
        activeUrl = url.absoluteString
        
        let service = ItunesTrackService()
        service.getTracks(predicate: predicate, completion: completionHandler)
    }
    
    
    // end current search
    func cancelRequest() {
        
    }
    
    private(set) var tracks: [TrackCellViewModel] = [
        TrackCellViewModel(track: ItunesTrack(artist: "Drake", track: "Never Gunna let you go", artwork: "google.com"))
    ]

}

