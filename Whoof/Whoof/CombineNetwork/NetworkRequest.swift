//
//  NetworkRequest.swift
//  Whoof
//
//  Created by Suchith Nayaka on 13/06/22.
//

import Combine
import Foundation

public protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkRequestError>
}

public class NativeRequestable: Requestable {
    public var requestTimeOut: Float = 30

    public func request<T>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkRequestError>
     where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
        
        guard let url = URL(string: req.url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(
                Fail<T, NetworkRequestError>(error: NetworkRequestError.badURL("Invalid Url"))
            )
        }
        // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
         print("$$\(url.absoluteString)&&")
//         if url.absoluteString.contains("set_user") {
//             print(String(data: req.body!, encoding: .utf8))
//             print("here")
//             postMethod(url: url, jsonData: req.body!)
//         }
         let request = req.buildURLRequest(with: url)
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { output in
                     // throw an error if response is nil
                print("$$\(output.response.url!.absoluteString)//")
                if ((output.response.url!.absoluteString.contains("user_ios"))) {
                    print(String(data: output.data, encoding: .utf8) ?? "")
                }
                
                guard output.response is HTTPURLResponse else {
                    throw NetworkRequestError.serverError(code: 0, error: "Server error")
                }
                
                if let httpResponse = output.response as? HTTPURLResponse {
                    if httpResponse.statusCode != 200 {
                        print("Houston we have a problem- \(httpResponse.statusCode)")
                        let responseData = String(data: output.data, encoding: .utf8)
                        print(responseData ?? "")
                        print("This is the problem")
                    }
                }
//
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if url.absoluteString.contains("add_partner") {
                    print("Here")
                }
                print("**Problem is with- \(url.absoluteString)**")
//                print(String(data: output.data, encoding: .utf8))
                print(BetterDecodingError(with: error))
                return NetworkRequestError.invalidJSON(String(describing: error))
                
            }
            .eraseToAnyPublisher()
    }
    
    
}

public struct NetworkRequest {
    let url: String
    var headers: [String: String]?
    let body: Data?
    let requestTimeOut: Float?
    let httpMethod: HTTPMethod
    
    public init(url: String,
                headers: [String: String]? = nil,
                reqBody: Encodable? = nil,
                reqTimeout: Float? = nil,
                httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.body = reqBody?.encode()
        self.requestTimeOut = reqTimeout
        self.httpMethod = httpMethod
    }
    
    public init(url: String,
                headers: [String: String]? = nil,
                reqBody: Data? = nil,
                reqTimeout: Float? = nil,
                httpMethod: HTTPMethod
    ) {
        
        self.url = url
        self.headers = headers
        self.body = reqBody
        self.requestTimeOut = reqTimeout
        self.httpMethod = httpMethod
//        self.
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        if headers != nil {
//            headers!["Accept"] = "application/json"
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        if urlRequest.allHTTPHeaderFields != nil {
            urlRequest.allHTTPHeaderFields!["Accept"] = "application/json"
        }
        
        urlRequest.httpBody = body
        return urlRequest
    }
}

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public enum NetworkRequestError: Error, Equatable {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case unknown(code: Int, error: String)
}

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}

