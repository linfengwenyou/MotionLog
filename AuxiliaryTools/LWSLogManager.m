//
//  LWSLogManager.m
//  TestCrash
//
//  Created by fumi on 2018/1/24.
//  Copyright © 2018年 fumi. All rights reserved.
//

#import "LWSLogManager.h"

@implementation LWSLogManager

static int logCount = 1;
static int maxCount = 2;        // 默认展示最多两个网络请求的日志信息

+ (void)writeLogMessage:(NSString *)logMessage
{
    if (logCount < maxCount) {
        NSString * lastMessage = [self readLogMessage];
        logMessage = [NSString stringWithFormat:@"%@\n******************\n******************\n%@",lastMessage,logMessage];
        logCount ++;
    } else {
        logCount = 1;
    }
    
    NSError *error = nil;
   BOOL isOK = [logMessage writeToFile:[self logPath] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"write %@",isOK?@"success":@"failure");
}

+ (NSString *)readLogMessage
{
    NSString *logMessage = [NSString stringWithContentsOfFile:[self logPath] encoding:NSUTF8StringEncoding error:nil];
    return logMessage;
}

+ (NSString *)logPath
{
    return  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"netLog.log"];
}

@end
