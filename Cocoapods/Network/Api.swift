

import UIKit


class APILoader<T: APIHandler> {
    
    let apiRequest: T
    
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()) {

        // prepare url request
        let urlRequest = apiRequest.makeRequest(with: requestData).urlRequest
        // do session task
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return completionHandler(nil, error) }
            // parse response
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: data)
                return completionHandler(parsedResponse, nil)
            } catch {
                return completionHandler(nil, error)
            }
        }.resume()
    }
}
