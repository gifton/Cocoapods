
import UIKit


class TrackCellViewModel: ViewModel {
    
    static func == (lhs: TrackCellViewModel, rhs: TrackCellViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var uuid: UUID {
        return UUID()
    }
    
    var id: String {
        return "\(String(describing: title))_\(String(describing: artist))_\(String(describing: artwork))";
    }
    
    init(track: ItunesTrack) {
        self.artist = track.artist
        self.title = track.track
        // download image
    }
    
    var artwork: UIImage?
    var title: String?
    var artist: String?
    var isDownloading: Bool = true
    
}

private extension TrackCellViewModel {
    
}
