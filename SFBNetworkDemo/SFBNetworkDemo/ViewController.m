//
//  ViewController.m
//  SFBNetworkDemo
//
//  Created by dfhb@rdd on 2017/12/13.
//  Copyright © 2017年 SoftBoys. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+SFBRequest.h"
#import "SFB_BaseRequestGroup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 多个请求
    [self requestWithGroup];
    
    [self singleRequest];
    
}

- (void)requestWithGroup {
    
    // 请求1
    NSString *url1 = @"http://116.211.167.106/api/live/aggregation";
    NSDictionary *param1 = @{@"uid":@"133825214",
                             @"interest":@"1",
                             @"count":@(20)};
    // 请求2
    NSString *url2 = @"https://m.vvgong.cn/linggb-ws/ws/0.1/adpic/getPicByType_v2";
    NSDictionary *param2 = @{@"type":@2, @"picFlag":@2, @"picLevel":@0};
    
    // 请求3
    NSString *url3 = @"https://m.vvgong.cn/linggb-ws/ws/0.1/common/locationAndDataCode";
    NSDictionary *param3 = nil;
    
    SFB_BaseRequest *request1 = [SFB_BaseRequest requestWithUrl:url1];
    request1.parameters = param1;
    
    
    SFB_BaseRequest *request2 = [SFB_BaseRequest requestWithUrl:url2];
    request2.parameters = param2;
    
    
    SFB_BaseRequest *request3 = [SFB_BaseRequest requestWithUrl:url3];
    request3.parameters = param3;
    
    SFB_BaseRequestGroup *group = [[SFB_BaseRequestGroup alloc] init];
    [group sendRequestGroup:@[request1, request2, request3] singleCompletion:^(SFB_BaseRequest *request) {
        NSLog(@"========BEGIN========");
        NSLog(@"url:%@", request.url);
        NSLog(@"statusCode:%@", @(request.response.statusCode));
        NSLog(@"========END========");
    } completed:^{
        NSLog(@"completion");
    }];
    
}

- (void)singleRequest {
    
    // 请求
    NSString *url = @"http://www.f2b2b.com/ecmobile/index.php?url=/user/signin";
    NSDictionary *param = @{@"name":@"18510060862", @"password":@"123456"};
    
    NSString *string = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:param options:0 error:nil] encoding:NSUTF8StringEncoding];
    NSDictionary *params = @{@"json":string};
    self.CANCEL(url);
    [self.POST_FORM(url).PARAM(params) SEND:^(SFB_BaseResponse *response) {
        if (response.statusCode == 200) {
            NSLog(@"wancheng");
        }
    }];
    
}


@end
