//
//  SFB_BaseRequestGroup.h
//  NetworkDemo
//
//  Created by dfhb@rdd on 2017/12/11.
//  Copyright © 2017年 f2b2b. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import "SFB_BaseRequest.h"


typedef void(^BTSingleRequestCompletionBlock)(SFB_BaseRequest *request);
typedef void(^BTGroupCompletionBlock)(void);

@interface SFB_BaseRequestGroup : NSObject

@property (nonatomic, copy) NSArray <SFB_BaseRequest*> *groupArray;

- (void)sendRequestGroup:(NSArray <SFB_BaseRequest *>*)groupArray completed:(BTGroupCompletionBlock)completed;
- (void)sendRequestGroup:(NSArray <SFB_BaseRequest *>*)groupArray singleCompletion:(BTSingleRequestCompletionBlock)singleCompleted completed:(BTGroupCompletionBlock)completed;

@end
