# MotionLog
摇动手机切换网络请求日志信息

> 原理：将日志信息，写入到本地文件中，然后，在需要的时候读取出来，以控制器的形式展示出来。

#### 拦截网络日志

```
// 通过请求来截取网络数据
+ (void)writeRequestUrl:(NSString *)url param:(NSDictionary *)param response:(NSDictionary *)dict
{
    NSString *message = [NSString stringWithFormat:@"requestURL:%@\nparam is :%@\n*******************\n response:\n%@",url,param,dict];
    [LWSLogManager writeLogMessage:message];
}
```



#### 在基类控制器中添加事件处理

```
// #import "LWSLogVC.h"
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [super motionEnded:motion withEvent:event];
    
    LWSLogVC *logVC = [[LWSLogVC alloc] init];
    [self.navigationController pushViewController:logVC animated:YES];
}

```





#### 使用AFN操作时如果需要拦截json数据

```
// 请求日志
// AFHTTPSessionManager.m 162行 NSLog(@"\n\nRequest:\t%@\nparam:\n%@\n*******************\n",URLString, parameters);
 
 
// 响应日志
// AFURLSessionManager.m 291行
NSLog(@"\n\nResponse:\n%@\n*******************\n",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
```



