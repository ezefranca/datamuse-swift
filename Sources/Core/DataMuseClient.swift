//
//  DataMuseClient.swift
//  datamuse-swift
//
//  Created by Ezequiel França on 09/11/17.
//
import Foundation

public struct DataMuseClient {
    
    typealias RequestCompletion = ([Words]?, NSError?) -> Void
    private var requester: DataRequester
    
    public init() {
        requester = DataRequester()
    }
    
    /// Returns words with a meaning similar to other
    ///
    /// - Parameters:
    ///   - to: word to find similars
    ///   - completion: completion block with array of similar words
    public func wordMeaningSimilar(to: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordMeaningSimilar(to: to) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
             completion(_words, error)
        }
    }
    
    /// Return an array of words related to another word starting with a specific character
    ///
    /// - Parameters:
    ///   - to: word to compare
    ///   - startedWith: start character of results
    ///   - completion: completion block with array of words
    public func wordRelated(to: String, startedWith:String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordRelated(to: to, startedWith: startedWith) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    
    /// Returns an Array of words related to ***word*** that end with the letter ***letter***
    ///
    /// - Parameters:
    ///   - to: word to compare
    ///   - finishedWith: finish character of results
    ///   - completion: completion block with array of words
    public func wordRelated(to: String, finishedWith:String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordRelated(to: to, finishedWith: finishedWith) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    
    /// Return an Array of words that sound like ***to***
    ///
    /// - Parameters:
    ///   - to: word to compare
    ///   - completion: completion block with array of words
    public func wordSoundsLike(to: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordSoundsLike(to: to) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    
    /// Return an array of words that start with ***start***, end with ***end***, and have ***numberofLettersBetween*** letters in between
    ///
    /// - Parameters:
    ///   - start: start character
    ///   - finish: finish character
    ///   - numberofLettersBetween: number of letters between start and finish
    ///   - completion: completion block with array of words
    public func word(start: String, finish: String, numberofLettersBetween:Int, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._word(starts: start, finish: finish, space: numberofLettersBetween) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    /// Returns an array of words that are spelled similarly to ***to***
    ///
    /// - Parameters:
    ///   - to: word to compare
    ///   - completion: completion block with array of words
    public func wordsSpelledSimilarly(to: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordsSpelledSimilarly(to: to) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    /// Returns an array of words that rhyme with ***with***
    ///
    /// - Parameters:
    ///   - with: word to compare
    ///   - completion: completion block with array of words
    public func wordsThatRhyme(with: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordsThatRhyme(with: with) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }

    /// Returns an array of words that rhyme with ***with*** related with ***related***
    ///
    /// - Parameters:
    ///   - with: word to compare
    ///   - related: related word
    ///   - completion: completion block with array of words
    public func wordsThatRhyme(with: String, related: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordsThatRhyme(with: with, related: related) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    
    /// Returns an array of words adjectives that are often used to describe ***to***
    ///
    /// - Parameters:
    ///   - to: word to compare
    ///   - completion: completion block with array of words
    public func adjectivesThatAreOften(to: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._adjectivesThatAreOften(to: to) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    /// Returns an array of words adjectives describing ***this*** sorted by how related they are to ***related***
    ///
    /// - Parameters:
    ///   - this: word to be described
    ///   - related: related sort word parameter
    ///   - completion: completion block with array of words
    public func adjectivesThatDescribing(this: String, related:String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._adjectivesThatDescribing(this: this, related: related) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    /// Returns an array of words nouns that are often described by the adjective
    ///
    /// - Parameters:
    ///   - by: word adjective
    ///   - completion: completion block with array of words
    public func nounsThatAreOftenDescribed(by: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._nounsThatAreOftenDescribed(by: by) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }

    /// Returns an array of words that often follow ***follow*** in a sentence, that start with the letter ***start***
    ///
    /// - Parameters:
    ///   - follow: word to often followed
    ///   - start: start character of results
    ///   - completion: completion block with array of words
    public func wordThatOften(follow: String, start: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordThatOften(follow: follow, start: start) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    /// Return an array of words that are triggered by (strongly associated with) the word ***by***
    ///
    /// - Parameters:
    ///   - by: word to be the trigger
    ///   - completion: completion block with array of words
    public func wordsThatAreTriggered(by: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._wordsThatAreTriggered(by: by) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
    
    /// Returns an array of words suggestions for the user if they have typed in ***into*** so far
    ///
    /// - Parameters:
    ///   - into: word to compare
    ///   - completion: completion block with array of words
    public func suggestionsBased(into: String, completion: @escaping ([Words]?, NSError?) -> Void) {
        
        self._suggestionsBased(into: into) { (words, error) in
            guard let _words = words else {
                completion(nil, nil)
                return
            }
            completion(_words, error)
        }
    }
}
    
extension DataMuseClient {
    
    internal func _wordMeaningSimilar(to: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?ml=")\(to)", completionHandler)
    }
    
    internal func _wordRelated(to: String, startedWith:String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?ml=")\(to)\("&sp="))\(startedWith)\("*")", completionHandler)
    }
    
    internal func _wordRelated(to: String, finishedWith:String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?ml=")\(to)\("&sp="))\("*")\(finishedWith)", completionHandler)
    }
    
    internal func _wordSoundsLike(to: String, completionHandler: @escaping RequestCompletion) {
        GET("\("/words?sl=")\(to)", completionHandler)
    }
    
    internal func _word(starts: String, finish: String, space:Int, _ completionHandler: @escaping RequestCompletion) {
        var _space = space
        if space <= 0 { _space = 1 }
        var between : String = ""
        for _ in 0..<_space {
            between += "?"
        }
        GET("\("/words?sp=")\(starts)\(between)\(finish)\"", completionHandler)
    }
    
    internal func _wordsSpelledSimilarly(to: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?sp=")\(to)", completionHandler)
    }
    
    internal func _wordsThatRhyme(with: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words??rel_rhy=")\(with)", completionHandler)
    }
    
    internal func _wordsThatRhyme(with: String, related: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?ml=")\(with)\("?rel_rhy=")\(related)", completionHandler)
    }
    
    internal func _adjectivesThatAreOften(to: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("//words?rel_jjb=")\(to)", completionHandler)
    }
    
    internal func _adjectivesThatDescribing(this: String, related:String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("words?rel_jjb=")\(this)\("&topics=")\(related)", completionHandler)
    }
    
    internal func _nounsThatAreOftenDescribed(by: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?rel_jja=")\(by)", completionHandler)
    }
    
    internal func _wordThatOften(follow: String, start: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/words?lc=")\(follow)\("&sp=")\(start)\("*")", completionHandler)
    }
    
    internal func _wordsThatAreTriggered(by: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("words?rel_trg=")\(by)", completionHandler)
    }
    
    internal func _suggestionsBased(into: String, _ completionHandler: @escaping RequestCompletion) {
        GET("\("/sug?s=")\(into)", completionHandler)
    }
    
    internal func GET(_ endpoint:String, _ completionHandler: @escaping ([Words]?, NSError?) -> Void) {
        requester.sendRequest(method: .get, endpoint: endpoint, headers: [:], body: "") {
            (data, response, error) in
            
            guard let response = response,
                let data = data,
                let httpResponse:HTTPURLResponse = response as? HTTPURLResponse else {
                    completionHandler(nil, error as NSError?)
                    return
            }
            
            if httpResponse.statusCode != 200 {
                completionHandler(nil, error as NSError?)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([Words].self, from: data)
                completionHandler(responseModel, nil)
                return
            }
            catch let error as NSError {
                completionHandler(nil, error)
                return
            }
        }
    }
}

