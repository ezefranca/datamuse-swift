//
//  Words.swift
//  datamuse-swift
//
//  Created by Ezequiel França on 09/11/17.
//

import Foundation

public struct Word: Codable {
    public let word: String
    public let score: Int?

    public init(word: String, score: Int?) {
        self.word = word
        self.score = score
    }
}
