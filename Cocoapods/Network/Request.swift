

import Foundation
class Request {
    
    private var request: URLRequest
    
    init(urlRequest: URLRequest, requestBuilder: RequestBuilder) {
        self.request = urlRequest
        // do configuration
        requestBuilder.setHeaders(request: &self.request)
    }
    
    var urlRequest: URLRequest {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppHelper.getDeviceID(), forHTTPHeaderField: "DeviceId")
        request.setValue(AppHelper.getCurrentLanguage(), forHTTPHeaderField: "Language")
        
        return request
    }
}



protocol RequestBuilder {
    func setHeaders(request: inout URLRequest)
}

class DefaultRequest: RequestBuilder {
    
    func setHeaders(request: inout URLRequest) {
        // header params
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppHelper.getDeviceID(), forHTTPHeaderField: "DeviceId")
        request.setValue(AppHelper.getCurrentLanguage(), forHTTPHeaderField: "DeviceLanguage")
    }
    
}
