
import Foundation



struct ItunesTrack: Codable, Response {
    var httpStatus: Int = 0
    
    var artist: String
    var track: String
    var artwork: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case track = "trackName"
        case artwork = "artworkUrl100"
    }
    
}
