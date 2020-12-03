
import Foundation
import UIKit



struct Constants {
    static var endpoint = "https://itunes.apple.com/search?term="
}

final class Device {
    
    static let width  = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let frame  = UIScreen.main.bounds
    static let tabBarheight = CGFloat(84)
}

// Padding standards
enum Padding: CGFloat {
    case xSmall = 2.0
    case small  = 5.0
    case medium = 10.0
    case large  = 15.0
    case xLarge = 20.0
    case xXLarge = 35.0
}
