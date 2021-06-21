//
//  XYMediAppInfo.h
//  XYMediAppInfo
//
//  Created by robbin on 2020/3/16.
//  Copyright (c) 2021 Hangzhou Xiaoying Innovation Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 中台底层产品信息配置类
@interface XYMediAppInfo : NSObject

/// 服务器返回的设备唯一标识
@property (nonatomic, copy, nullable) NSString * duid;

/// 用户唯一标识
@property (nonatomic, copy, nullable) NSString * auid;

/// 用户唯一标识（非数字型，例如DAx320Dfs）
@property (nonatomic, copy, nullable) NSString * auidMixType;

/// appkey
@property (nonatomic, copy, nullable) NSString * appkey;

/// 产品标识
@property (nonatomic, assign) NSInteger productID;

/// App当前语言
@property (nonatomic, copy, nullable) NSString * language;

/// App当前国家
@property (nonatomic, copy, nullable) NSString * countryCode;

/// 当前是合法的App信息，必须要设置duid
@property (nonatomic, assign, readonly, getter=isLegalAppInfomation) BOOL legalAppInfomation;

/// 渠道
@property (nonatomic, copy, readonly, nullable) NSString * channel;

/// 排除渠道的AppKey
@property (nonatomic, copy, readonly, nullable) NSString * pureAppKey;

/// 单例
+ (instancetype)sharedInstance;

/// 设置配置回调
/// @param block 回调
- (void)configWithBlock:(void(^)(XYMediAppInfo * appInfo))block;

@end

NS_ASSUME_NONNULL_END
