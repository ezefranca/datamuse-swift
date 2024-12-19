//
//  ViewController.swift
//  datamuse-swift
//
//  Created by ezefranca on 11/11/2017.
//  Copyright (c) 2017 ezefranca. All rights reserved.
//

import UIKit
import datamuse_swift

class ViewController: UIViewController {

    @IBOutlet var input: UITextField!
    @IBOutlet var result: UITextView!
    @IBOutlet var search: UIButton!
    
    private let dataMuseClient = DataMuseClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchTapped(_ sender: UIButton) {
        guard let text = input.text, !text.isEmpty else {
            result.text = "Please enter a word to search."
            return
        }
        
        result.text = "Searching..."
        
        Task {
            do {
                let words = try await dataMuseClient.fetchWords(endpoint: .similarWords(to: text))
                
                DispatchQueue.main.async {
                    if words.isEmpty {
                        self.result.text = "No similar words found."
                    } else {
                        self.result.text = words.map { $0.word }.joined(separator: "\n")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.result.text = "An error occurred: \(error.localizedDescription)"
                }
            }
        }
    }
}
