//
//  DataRequester.swift
//  datamuse-swift
//
//  Created by Ezequiel França on 09/11/17.
//

struct DataRequester {
    
    let baseURL = "https://api.datamuse.com/"
    let session: URLSession
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    init() {
        let sessionConfiguration = URLSessionConfiguration.default
        session = URLSession(configuration: sessionConfiguration, delegate: Delegate(), delegateQueue: nil)
    }
    
    func sendRequest(method: Method,
                     endpoint: String,
                     headers: [String: String] = [:],
                     body: String,
                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let URL = URL(string: baseURL + endpoint) else { return }
        let request = NSMutableURLRequest(url: URL as URL)
        
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body.data(using: String.Encoding.utf8, allowLossyConversion: true)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
        task.resume()
    }
    
    private class Delegate: NSObject, URLSessionDelegate {
        func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
                let trust = challenge.protectionSpace.serverTrust {
                let credential = URLCredential(trust: trust)
                completionHandler(.useCredential, credential)
            }
        }
    }
}
