import UIKit


class AppHelper {
    
}


/// Get device related information
extension AppHelper {
    
    static func getDeviceID() -> String {
        
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static func getBuildNumber() -> String {
        
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
    
    static func getVersionNumber() -> String {
        
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    static func getCurrentLanguage() -> String {
        
        return Locale.current.languageCode!
    }
    
    class var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            // 44.0 on iPhone X, 20.0 on iPhone 8 on iOS 12+.
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
}

extension AppHelper {
    
    func printJSONObject(data: Data) {
        do {
            let json = try? JSONSerialization.jsonObject(with: data, options : .allowFragments)
            dump(json)
        }
    }
}




