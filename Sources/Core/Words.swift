//
//  Words.swift
//  datamuse-swift
//
//  Created by Ezequiel França on 09/11/17.
//

import Foundation

public struct Words : Codable {
    
    public let word : String?
    public let score : Int?
    
    enum CodingKeys: String, CodingKey {
        case word = "word"
        case score = "score"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        word = try values.decodeIfPresent(String.self, forKey: .word)
        score = try values.decodeIfPresent(Int.self, forKey: .score)
    }
    
}
