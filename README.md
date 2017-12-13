
## SFBNetwork
#### `SFBNetwork `是一款基于`AFNetworking `的网络库，以`block`方式调用，支持队列组请求

#### 版本
- 最新版本 `v0.0.1`


## 安装
#### 使用CocoaPods
	pod 'SFBNetwork'
#### 手动导入
- 将`SFBNetwork `文件夹拖拽到项目中
- 引入头文件 `#import "NSObject+SFBRequest.h"`

## 使用方法
	NSString *url = @"http://116.211.167.106/api/live/aggregation";
    NSDictionary *param = @{@"uid":@"133825214",
                            @"interest":@"1",
                            @"count":@(20)};
                             
    self.CANCEL(url);
    [self.GET(url).PARAM(param) SEND:^(BT_BaseResponse *response) {
        if (response.statusCode == 200) {
            NSLog(@"wancheng");
        }
    }];
	

## 证书
`SFBNetwork `基于 `MIT`证书协议
