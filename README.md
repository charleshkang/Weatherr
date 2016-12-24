# C4QWeather
View a 7 day weather forecast for Long Island City. Temperatures shown are min&max temperatures, as well as the forecast day. I used Swift 3 and followed the MVC Design Pattern.

## Implementation
I chose MVC as the design pattern for this project because it's what I'm most used to, and through careful abstraction, can be very organized. I used GCD to make my data fetching asynchronous. Because they are public functions, this leads to reusability in future projects. I implemented error handling in my `WeatherStatus` file, and took advantage of `guard`s early exit feature to ensure any errors from the backend were handled.

I chose to make the UI in Interface Builder because I like seeing the app's flow and design easily. Another reason being this is a 1 screen app. 

Through my use of extensions, I've allowed my view controllers to stay organized.

## Pods
- SwiftyJSON (handle JSON data better and more easily)
- Alamofire (to make networking simpler, and used in conjunction with SwiftyJSON)

## Requirements
- Xcode 8
- iOS 10.0
- Swift 3

## Installation
- Install [Cocoapods](http://guides.cocoapods.org/using/getting-started.html#installation).
- cd to directory and use `pod init` to create a Podfile

```swift
open Podfile
```
- Add the following to Podfile
  ```swift
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '10.0'
  use_frameworks!

  pod 'Alamofire', '~> 3.0’
  pod 'SwiftyJSON', '2.4.0'
  ```
- Save and install pods
```swift
pod install
```
- Open C4QWeather.xcworkspace

## Future Plans
- Implement unit and ui tests
