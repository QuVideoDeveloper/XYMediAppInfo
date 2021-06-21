//
//  XYMediAppInfoTests.m
//  XYMediAppInfo_Tests
//
//  Created by SandsLee on 2021/6/21.
//  Copyright (c) 2021 Hangzhou Xiaoying Innovation Technology Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <XYMediAppInfo/XYMediAppInfo.h>

@interface XYMediAppInfoTests : XCTestCase

@property (nonatomic, copy) NSString *currentDuid;
@property (nonatomic, copy) NSString *currentAuid;
@property (nonatomic, copy) NSString *currentAuidMixType;

@end

@implementation XYMediAppInfoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // 初始化
    self.currentDuid = @"DI3F4x8l";
    self.currentAuid = @"DASands1121";
    self.currentAuidMixType = @"DAx320Dfs";
    
    [[XYMediAppInfo sharedInstance] configWithBlock:^(XYMediAppInfo * _Nonnull appInfo) {
        appInfo.duid = self.currentDuid;
        appInfo.auid = self.currentAuid;
        appInfo.auidMixType = self.currentAuidMixType;
        appInfo.appkey = @"200085TS";
        appInfo.productID = 10;
        appInfo.language = @"Zh-Hans";
        appInfo.countryCode = @"CN";
    }];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testAppInfo {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *duid = [XYMediAppInfo sharedInstance].duid;
    XCTAssert([duid isEqualToString:self.currentDuid], @"duid 测试失败");
    
    NSString *auid = [XYMediAppInfo sharedInstance].auid;
    XCTAssert([auid isEqualToString:self.currentAuid], @"auid 测试失败");
    
    NSString *auidMixType = [XYMediAppInfo sharedInstance].auidMixType;
    XCTAssert([auidMixType isEqualToString:self.currentAuidMixType], @"auidMixType 测试失败");
    
    NSString *appkey = [XYMediAppInfo sharedInstance].appkey;
    XCTAssert([appkey isEqualToString:@"200085TS"], @"appkey 测试失败");
    
    NSInteger productId = [XYMediAppInfo sharedInstance].productID;
    XCTAssert(productId == 10, @"productId 测试失败");
    
    NSString *lan = [XYMediAppInfo sharedInstance].language;
    XCTAssert([lan isEqualToString:@"Zh-Hans"], @"language 测试失败");
    
    NSString *countryCode = [XYMediAppInfo sharedInstance].countryCode;
    XCTAssert([countryCode isEqualToString:@"CN"], @"countryCode 测试失败");
    
    BOOL isLegal = [XYMediAppInfo sharedInstance].isLegalAppInfomation;
    XCTAssertTrue(isLegal, @"isLegalAppInfomation 测试失败");
    
    NSString *channel = [XYMediAppInfo sharedInstance].channel;
    XCTAssert([channel isEqualToString:@"TS"], @"channel 测试失败");
    
    NSString *pureAppKey = [XYMediAppInfo sharedInstance].pureAppKey;
    XCTAssert([pureAppKey isEqualToString:@"200085"], @"pureAppKey 测试失败");
}

- (void)testRefreshAppInfo {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 更新
    self.currentDuid = @"DI3F4x8l_2";
    self.currentAuid = @"DASands1121_2";
    self.currentAuidMixType = @"DAx320Dfs_2";
    
    NSString *duid = [XYMediAppInfo sharedInstance].duid;
    XCTAssert([duid isEqualToString:self.currentDuid], @"duid 更新测试失败");
    
    NSString *auid = [XYMediAppInfo sharedInstance].auid;
    XCTAssert([auid isEqualToString:self.currentAuid], @"auid 更新测试失败");
    
    NSString *auidMixType = [XYMediAppInfo sharedInstance].auidMixType;
    XCTAssert([auidMixType isEqualToString:self.currentAuidMixType], @"auidMixType 更新测试失败");
}

@end
