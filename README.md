# services
A bootstrap project for your networking framework to your iOS/tvOS/OSX/watchOS application

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 7.3+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Webhose into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '8.0' #or :tvos, '9.0' #or :osx, '10.9' #or :watchos, '2.0'
use_frameworks!

pod 'Services', :git => 'https://github.com/tiagomartinho/services'
```

Then, run the following command:

```bash
$ pod install
```
