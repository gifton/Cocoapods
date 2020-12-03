
import Foundation


struct TrackListApi: APIHandler {
    
    
    func makeRequest(with predicate: String) -> Request {
        let url = URL(string: Constants.endpoint + predicate)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return Request(urlRequest: request, requestBuilder: DefaultRequest())
    }
    
    func parseResponse(data: Data) throws -> ItunesTracks {
        return try defaultParseResponse(data: data)
    }
    
    func decode(json: Data) throws -> [ItunesTrack] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let items = try decoder.decode([ItunesTrack].self, from: json)
        
        return items
    }
}

