
import UIKit

// MARK: CGSize helper methods
extension CGSize {
    
    /// Creates a point with unnamed arguments.
    public init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width,  height: height)
    }
    
    // size from single value
    public init(_ size: CGFloat)  {
        self.init(width: size, height: size)
    }
    
}

// MARK: - resizing image to desired needs
func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(size.width * heightRatio, size.height * heightRatio)
    } else {
        newSize = CGSize(size.width * widthRatio,  size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(0, 0, newSize.width, newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage ?? UIImage()
}
