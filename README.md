# XYMediAppInfo

[![CI Status](https://img.shields.io/travis/irobbin1024/XYMediAppInfo.svg?style=flat)](https://travis-ci.org/irobbin1024/XYMediAppInfo)
[![Version](https://img.shields.io/cocoapods/v/XYMediAppInfo.svg?style=flat)](https://cocoapods.org/pods/XYMediAppInfo)
[![License](https://img.shields.io/cocoapods/l/XYMediAppInfo.svg?style=flat)](https://cocoapods.org/pods/XYMediAppInfo)
[![Platform](https://img.shields.io/cocoapods/p/XYMediAppInfo.svg?style=flat)](https://cocoapods.org/pods/XYMediAppInfo)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XYMediAppInfo is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XYMediAppInfo'
```

## 用法

```objc
[[XYMediAppInfo sharedInstance] configWithBlock:^(XYMediAppInfo * _Nonnull appInfo) {
    appInfo.duid = @"xxx";
    appInfo.appkey = @"xxxx";
    appInfo.productID = 10;
}];

NSLog(@"%@", [XYMediAppInfo sharedInstance].duid);
```

## Author

longbin.lai, longbin.lai@quvideo.com

## License

XYMediAppInfo is available under the GPL license. See the LICENSE file for more info.
