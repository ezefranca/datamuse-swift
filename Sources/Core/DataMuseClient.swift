//
//  DataMuseClient.swift
//  datamuse-swift
//
//  Created by Ezequiel França on 09/11/17.
//
import Foundation

public struct DataMuseClient {
    private let baseURL = "https://api.datamuse.com"
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    /// Fetch words based on the given endpoint
    /// - Parameter endpoint: The endpoint specifying the API request
    /// - Returns: Array of `Word` objects
    public func fetchWords(endpoint: Endpoint) async throws -> [Word] {
        guard let url = endpoint.url(baseURL: baseURL) else {
            throw DataMuseError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw DataMuseError.invalidResponse
        }

        do {
            let decodedResponse = try JSONDecoder().decode([Word].self, from: data)
            return decodedResponse
        } catch {
            throw DataMuseError.decodingError(error)
        }
    }

    public enum DataMuseError: Error {
        case invalidURL
        case invalidResponse
        case decodingError(Error)
    }
}

public enum Endpoint {
    case similarWords(to: String)
    case wordsRelated(to: String, startingWith: String)
    case wordsEndingWith(to: String, endingWith: String)
    case wordsSpelledLike(String)
    case wordsThatRhyme(with: String)
    case wordsThatRhymeWithRelated(with: String, related: String)
    case adjectivesOftenUsed(toDescribe: String)
    case adjectivesDescribing(this: String, related: String)
    case nounsOftenDescribed(byAdjective: String)
    case wordsThatFollow(following: String, startingWith: String)
    case wordsTriggered(by: String)
    case suggestions(for: String)
    case wordWithPattern(start: String, finish: String, lettersBetween: Int)

    func url(baseURL: String) -> URL? {
        var components = URLComponents(string: baseURL)
        switch self {
        case .similarWords(let to):
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "ml", value: to)]
        case .wordsRelated(let to, let startingWith):
            components?.path = "/words"
            components?.queryItems = [
                URLQueryItem(name: "ml", value: to),
                URLQueryItem(name: "sp", value: "\(startingWith)*")
            ]
        case .wordsEndingWith(let to, let endingWith):
            components?.path = "/words"
            components?.queryItems = [
                URLQueryItem(name: "ml", value: to),
                URLQueryItem(name: "sp", value: "*\(endingWith)")
            ]
        case .wordsSpelledLike(let word):
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "sp", value: word)]
        case .wordsThatRhyme(let with):
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "rel_rhy", value: with)]
        case .wordsThatRhymeWithRelated(let with, let related):
            components?.path = "/words"
            components?.queryItems = [
                URLQueryItem(name: "ml", value: with),
                URLQueryItem(name: "rel_rhy", value: related)
            ]
        case .adjectivesOftenUsed(toDescribe: let word):
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "rel_jjb", value: word)]
        case .adjectivesDescribing(let this, let related):
            components?.path = "/words"
            components?.queryItems = [
                URLQueryItem(name: "rel_jjb", value: this),
                URLQueryItem(name: "topics", value: related)
            ]
        case .nounsOftenDescribed(byAdjective: let adjective):
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "rel_jja", value: adjective)]
        case .wordsThatFollow(let following, let startingWith):
            components?.path = "/words"
            components?.queryItems = [
                URLQueryItem(name: "lc", value: following),
                URLQueryItem(name: "sp", value: "\(startingWith)*")
            ]
        case .wordsTriggered(by: let word):
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "rel_trg", value: word)]
        case .suggestions(let input):
            components?.path = "/sug"
            components?.queryItems = [URLQueryItem(name: "s", value: input)]
        case .wordWithPattern(let start, let finish, let lettersBetween):
            let pattern = String(repeating: "?", count: max(lettersBetween, 1))
            components?.path = "/words"
            components?.queryItems = [URLQueryItem(name: "sp", value: "\(start)\(pattern)\(finish)")]
        }
        return components?.url
    }
}
