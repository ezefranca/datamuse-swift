## datamuse-swift

<!--[![Platforms](https://img.shields.io/cocoapods/p/datamuse-swift.svg)](https://cocoapods.org/pods/datamuse-swift)-->
[![License](https://img.shields.io/cocoapods/l/datamuse-swift.svg)](https://raw.githubusercontent.com/ezefranca/datamuse-swift/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
<!--[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)-->
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/datamuse-swift.svg)](https://cocoapods.org/pods/datamuse-swift)

[![Travis](https://img.shields.io/travis/ezefranca/datamuse-swift/master.svg)](https://travis-ci.org/ezefranca/datamuse-swift/branches)

[![logo](https://www.datamuse.com/api/datamuse-logo-rgb.png)](https://www.datamuse.com/api/)

A datamuse api swift wrapper without dependencies

![](https://media.giphy.com/media/xT1R9zyKuQM9ga0ZK8/giphy.gif)

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 9.3+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 4.0+
- Xcode 9.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate datamuse-swift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'datamuse-swift', '~> 0.0.1'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate datamuse-swift into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "datamuse-swift/datamuse-swift" ~> 0.0.1
```
### Swift Package Manager

To use datamuse-swift as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
import PackageDescription

let package = Package(
    name: "Hellodatamuse-swift",
    dependencies: [
        .Package(url: "https://github.com/ezefranca/datamuse-swift.git", "0.0.1")
    ]
)
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate datamuse-swift into your project manually. Just copy the `Core` folder to your project.

## Usage

You just need a instace of `DataMuseClient` and can start yours calls.

```swift
let client = DataMuseClient()
```

All calls returns a `[Words]`.  The `Word` are a struct with the score result of API and the word string:

```swift
public struct Words : Codable {
    public let word : String?
    public let score : Int?
}
```

### List with all methods:

 - words with a meaning similar to ringing in the ears
```swift
public func wordMeaningSimilar(to: String, completion: @escaping ([Words]?, NSError?) -> Void)
```
- words related to duck that start with the letter b
```swift
public func wordRelated(to: String, startedWith: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- words related to spoon that end with the letter a
```swift
public func wordRelated(to: String, finishedWith: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- words that sound like elefint
```swift
public func wordSoundsLike(to: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- words that start with t, end in k, and have two letters in between
```swift
public func word(start: String, finish: String, numberofLettersBetween: Int, completion: @escaping ([Words]?, NSError?) -> Void)
```
- words that are spelled similarly to coneticut
```swift
public func wordsSpelledSimilarly(to: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- words that rhyme with forgetful
```swift
public func wordsThatRhyme(with: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- words that rhyme with grape that are related to breakfast
```swift
public func wordsThatRhyme(with: String, related: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- adjectives that are often used to describe ocean
```swift
public func adjectivesThatAreOften(to: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- adjectives describing ocean sorted by how related they are to temperature
```swift
public func adjectivesThatDescribing(this: String, related: String, completion: @escaping ([Words]?, NSError?) -> Void)

```

- nouns that are often described by the adjective yellow
```swift
public func nounsThatAreOftenDescribed(by: String, completion: @escaping ([Words]?, NSError?) -> Void)

```
- words that often follow "drink" in a sentence, that start with the letter w
```swift
public func wordThatOften(follow: String, start: String, completion: @escaping ([Words]?, NSError?) -> Void)
```
- words that are triggered by (strongly associated with) the word "cow"
```swift
public func wordsThatAreTriggered(by: String, completion: @escaping ([Words]?, NSError?) -> Void)
```
- suggestions for the user if they have typed in rawand so far
```swift
public func suggestionsBased(into: String, completion: @escaping ([Words]?, NSError?) -> Void)
```
## License

datamuse-swift is released under the MIT license. See [LICENSE](https://github.com/ezefranca/datamuse-swift/blob/master/LICENSE) for details.
