
import UIKit


protocol TrackDecodable: ViewModel { }

extension TrackDecodable {
    // convert json -> ItunesTrack
    func decode(json: Data) throws -> [ItunesTrack] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let items = try decoder.decode([ItunesTrack].self, from: json)
        
        return items
    }
}
