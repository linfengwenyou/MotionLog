//
//  LWSLogManager.h
//  TestCrash
//
//  Created by fumi on 2018/1/24.
//  Copyright © 2018年 fumi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWSLogManager : NSObject
/** 写入日志信息 */
+ (void)writeLogMessage:(NSString *)logMessage;
/** 读取日志信息 */
+ (NSString *)readLogMessage;
@end
