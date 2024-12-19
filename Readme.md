# datamuse-swift

[![Platforms](https://img.shields.io/cocoapods/p/datamuse-swift.svg)](https://cocoapods.org/pods/datamuse-swift)
[![License](https://img.shields.io/cocoapods/l/datamuse-swift.svg)](https://raw.githubusercontent.com/ezefranca/datamuse-swift/master/LICENSE)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/datamuse-swift.svg)](https://cocoapods.org/pods/datamuse-swift)

[![logo](https://www.datamuse.com/api/datamuse-logo-rgb.png)](https://www.datamuse.com/api/)

A Datamuse API Swift wrapper without external depedencies and support for async/await.

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Methods](#methods)
- [License](#license)

## Requirements

- iOS 15+ / macOS 12+ / tvOS 15+ / watchOS 8+
- Xcode 15.0+

## Installation

### Swift Package Manager

To integrate `datamuse-swift` into your Xcode project, open your project settings, navigate to the "Package Dependencies" section, and add the following URL:

```
https://github.com/ezefranca/datamuse-swift.git
```

### CocoaPods

Add the following to your `Podfile`:

```ruby
platform :ios, '15.0'
use_frameworks!

pod 'datamuse-swift', '~> 1.0.0'
```

Run the following command to install the dependency:

```bash
$ pod install
```

### Manual Installation

Clone the repository and drag the `Sources` folder into your Xcode project.

## Usage

### Getting Started

First, import the library:

```swift
import datamuse_swift
```

Create an instance of `DataMuseClient`:

```swift
let client = DataMuseClient()
```

### Fetching Words

Use the `fetchWords` method with any of the predefined endpoints.

#### Example: Fetch Similar Words

```swift
Task {
    do {
        let words = try await client.fetchWords(endpoint: .similarWords(to: "ring"))
        words.forEach { print($0.word) }
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}
```

## Methods

The following endpoints are available:

| Description                                                   | Method                                                                                       |
|---------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| Words with a meaning similar to a given word                 | `.similarWords(to: String)`                                                                 |
| Words related to a word that start with a specific letter    | `.wordsRelated(to: String, startingWith: String)`                                           |
| Words related to a word that end with a specific letter      | `.wordsEndingWith(to: String, endingWith: String)`                                          |
| Words spelled similarly to a given word                     | `.wordsSpelledLike(String)`                                                                 |
| Words that rhyme with a given word                          | `.wordsThatRhyme(with: String)`                                                             |
| Words that rhyme with a given word and are related          | `.wordsThatRhymeWithRelated(with: String, related: String)`                                 |
| Adjectives often used to describe a word                   | `.adjectivesOftenUsed(toDescribe: String)`                                                  |
| Adjectives describing a word sorted by related topics       | `.adjectivesDescribing(this: String, related: String)`                                      |
| Nouns often described by a given adjective                 | `.nounsOftenDescribed(byAdjective: String)`                                                 |
| Words that often follow another word in a sentence          | `.wordsThatFollow(following: String, startingWith: String)`                                 |
| Words triggered by (strongly associated with) another word | `.wordsTriggered(by: String)`                                                              |
| Suggestions based on partial input                         | `.suggestions(for: String)`                                                                |
| Words that start, finish, and have a specific pattern      | `.wordWithPattern(start: String, finish: String, lettersBetween: Int)`                     |

### Word Model

All API responses return an array of `Word` objects:

```swift
public struct Word: Codable {
    public let word: String
    public let score: Int?
}
```

## License

`datamuse-swift` is released under the MIT license. See [LICENSE](https://github.com/ezefranca/datamuse-swift/blob/master/LICENSE) for details.
