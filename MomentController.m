//
//  MomentController.m
//  WeChatDemo
//
//  Created by wanglong on 16/7/29.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "MomentController.h"

@implementation MomentController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"朋友圈";
    
    UIButton *btn = [[UIButton alloc] init];
    
    
    [btn setTitle:@"返回自己的应用" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    CGRect rect = btn.frame;
    rect.origin.x = 100;
    rect.origin.y = 100;
    btn.frame = rect;
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
}

- (void)btnclick
{
    NSLog(@"%s",__func__);
    
    UIApplication *app = [UIApplication sharedApplication];
    
    NSURL *sourceUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://",self.urlStr]];
    if ([app canOpenURL:sourceUrl]) {
        [app openURL:sourceUrl];
    }
    
}
@end
