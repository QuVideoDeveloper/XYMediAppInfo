//
//  XYMediAppInfo.m
//  XYMediAppInfo
//
//  Created by robbin on 2020/3/16.
//  Copyright (c) 2021 Hangzhou Xiaoying Innovation Technology Co., Ltd. All rights reserved.
//

#import "XYMediAppInfo.h"

@interface XYMediAppInfo ()

@property (nonatomic, copy) void (^configBlock)(XYMediAppInfo * _Nonnull);

@end

@implementation XYMediAppInfo

+ (instancetype)sharedInstance {
    static dispatch_once_t pred;
    static XYMediAppInfo *sharedInstance;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[XYMediAppInfo alloc] init];
    });
    
    return sharedInstance;
}

- (NSString *)appkey {
    if (self == [XYMediAppInfo sharedInstance] && self.configBlock == nil) {
        NSAssert(NO, @"必须设置configBlock");
    }
    
    return _appkey;
}

- (NSInteger)productID {
    if (self == [XYMediAppInfo sharedInstance] && self.configBlock == nil) {
        NSAssert(NO, @"必须设置configBlock");
    }
    
    return _productID;
}

- (NSString *)language {
    if (self == [XYMediAppInfo sharedInstance] && self.configBlock == nil) {
        NSAssert(NO, @"必须设置configBlock");
    }
    
    return _language;
}

- (NSString *)countryCode {
    if (self == [XYMediAppInfo sharedInstance] && self.configBlock == nil) {
        NSAssert(NO, @"必须设置configBlock");
    }
    
    return _countryCode;
}

- (NSString *)duid {
    [self refreshAppInfo];
    return _duid;
}

- (NSString *)auid {
    [self refreshAppInfo];
    return _auid;
}

- (NSString *)auidMixType {
    [self refreshAppInfo];
    return _auidMixType;
}

- (void)refreshAppInfo {
    XYMediAppInfo * appInfo = [XYMediAppInfo new];
    if (self.configBlock) {
        self.configBlock(appInfo);
        _duid = appInfo.duid;
        _auid = appInfo.auid;
        _auidMixType = appInfo.auidMixType;
        _appkey = appInfo.appkey;
        _productID = appInfo.productID;
        _language = appInfo.language;
        _countryCode = appInfo.countryCode;
    } else {
        if (self == [XYMediAppInfo sharedInstance]) {
            NSAssert(NO, @"必须设置configBlock");
        }
    }
}

- (NSString *)channel {
    if (self.appkey && self.appkey.length >= 8) {
        return [self.appkey substringFromIndex:6];
    }
    return nil;
}

- (NSString *)pureAppKey {
    if (self.appkey && self.appkey.length >= 8) {
        return [self.appkey substringToIndex:6];
    }
    return nil;
}

- (void)configWithBlock:(void (^)(XYMediAppInfo * _Nonnull))block {
    self.configBlock = block;
    
    [self refreshAppInfo];
}

- (BOOL)isLegalAppInfomation {
    if ([self.duid isKindOfClass:[NSString class]]) {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        return [self.duid stringByTrimmingCharactersInSet:set].length > 0;
    }
    return NO;
}

@end
