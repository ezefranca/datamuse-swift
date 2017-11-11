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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchTapped(_ sender: UIButton) {
        self.result.text = ""
        if let text = input.text {
            DataMuseClient().wordMeaningSimilar(to: text) { (words, error) in
                if let _words = words {
                    for word in _words {
                        if let w = word.word {
                            DispatchQueue.main.sync {
                                self.result.text.append("\("\n")\(w)")
                            }
                       }
                    }
                } else {
                    DispatchQueue.main.sync {
                        self.result.text = "error"
                    }
                }
            }
        }
    }
}

