
import Foundation


struct TrackLsitApi: ApiHandler {
    
    
    func makeRequest(from data: [String: Any]) -> Request {
        let url = URL(string: Constants.endpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return Request(urlRequest: request, requestBuilder: DefaultRequest())
    }
    
    func parseResponse(data: Data) throws -> [ItunesTrack] {
        return try defaultParseResponse(data: data)
    }
    
    func decode(json: Data) throws -> [ItunesTrack] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let items = try decoder.decode([ItunesTrack].self, from: json)
        
        return items
    }
}
