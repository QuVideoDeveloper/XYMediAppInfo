//
//  XYViewController.m
//  XYMediAppInfo
//
//  Created by QuVideoInc. on 03/16/2020.
//  Copyright (c) 2021 Hangzhou Xiaoying Innovation Technology Co., Ltd. All rights reserved.
//

#import "XYViewController.h"
#import "XYMediAppInfo.h"

@interface XYViewController ()

@end

@implementation XYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[XYMediAppInfo sharedInstance] configWithBlock:^(XYMediAppInfo * _Nonnull appInfo) {
        appInfo.duid = @"xxx";
        appInfo.appkey = @"xxxx";
        appInfo.productID = 10;
    }];
    NSLog(@"%@", [XYMediAppInfo sharedInstance].duid);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
