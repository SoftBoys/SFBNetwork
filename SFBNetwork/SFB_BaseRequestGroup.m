//
//  SFB_BaseRequestGroup.m
//  NetworkDemo
//
//  Created by dfhb@rdd on 2017/12/11.
//  Copyright © 2017年 f2b2b. All rights reserved.
//  

#import "SFB_BaseRequestGroup.h"

@implementation SFB_BaseRequestGroup
- (void)sendRequestGroup:(NSArray<SFB_BaseRequest *> *)groupArray completed:(BTGroupCompletionBlock)completed {
    [self sendRequestGroup:groupArray singleCompletion:nil completed:completed];
}
- (void)sendRequestGroup:(NSArray<SFB_BaseRequest *> *)groupArray singleCompletion:(BTSingleRequestCompletionBlock)singleCompleted completed:(BTGroupCompletionBlock)completed {
    _groupArray = groupArray;
    
    dispatch_group_t group = dispatch_group_create();
    
    [groupArray enumerateObjectsUsingBlock:^(SFB_BaseRequest * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
        
        [obj sendWithCompleted:^(SFB_BaseResponse *response) {
            if (singleCompleted) {
                singleCompleted(obj);
            }
            dispatch_group_leave(group);
        }];
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (completed) {
            completed();
        }
    });
    
}

@end
