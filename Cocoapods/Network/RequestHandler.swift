//
//  RequestHandler.swift
//  Cocoapods
//
//  Created by Gifton on 12/3/20.
//  Copyright © 2020 Javier. All rights reserved.
//

import Foundation
import UIKit

protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(from data: RequestDataType) -> Request
    
}


protocol ResponseHandler {
    associatedtype ResponseDataType
    
    func parseResponse(data: Data) throws -> ResponseDataType
}


typealias ApiHandler = ResponseHandler & RequestHandler


extension ResponseHandler {
    
    /// generic response data parser
    func defaultParseResponse<T: Response>(data: Data) throws -> T {

        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        if let body = try? jsonDecoder.decode(T.self, from: data), body.httpStatus == 200 {
            return body
        } else if let errorResponse = try? jsonDecoder.decode(ServiceError.self, from: data) {
            throw errorResponse
        } else {
            throw UnknownParseError()
        }
    }
}

// MARK: - Response
protocol Response: Codable {
    var httpStatus: Int { set get }
}

// define unknown error
struct UnknownParseError: Error { }

// define service error types
struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?
}
