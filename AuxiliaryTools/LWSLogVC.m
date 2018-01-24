//
//  LWSLogVC.m
//  TestCrash
//
//  Created by fumi on 2018/1/24.
//  Copyright © 2018年 fumi. All rights reserved.
//

#import "LWSLogVC.h"
#import "LWSLogManager.h"

@interface LWSLogVC ()
@property (nonatomic, strong) UITextView *logView;
@end

@implementation LWSLogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
    // 显示最新的网络日志信息
    
    // 读取网络的日志信息
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.logView scrollRangeToVisible:NSMakeRange(self.logView.text.length, 1)];
    self.logView.layoutManager.allowsNonContiguousLayout = NO;
}

- (void)initUI
{
    [self.view addSubview:self.logView];
    self.title = @"网络请求日志信息";
}

- (void)initData
{
    // 读取日志信息，并进行数据展示
    self.logView.text = [LWSLogManager readLogMessage];
}


#pragma mark - setter & getter
- (UITextView *)logView
{
    if (!_logView) {
        _logView = [[UITextView alloc] initWithFrame:self.view.bounds];
        _logView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _logView.editable = NO;
        _logView.selectable = NO;
    }
    return _logView;
}


@end
