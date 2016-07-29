//
//  AppDelegate.m
//  WeChatDemo
//
//  Created by wanglong on 16/7/29.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactsController.h"
#import "MomentController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    NSLog(@"options == %@",url.absoluteString);
    
    //第一种方法不过不太好
//    NSRange range = [url.absoluteString rangeOfString:@"?"];
//    NSString *subStr = [url.absoluteString substringFromIndex:range.location + 1];
//    NSLog(@"subStr ==%@",subStr);
    
    //第二种方法
    NSString *subStr = [[url.absoluteString componentsSeparatedByString:@"?"] lastObject];
    
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
//    [nav popToViewController:[nav.childViewControllers firstObject] animated:YES];
    [nav popToRootViewControllerAnimated:YES];
   if([url.absoluteString containsString:@"wechat://moments" ]) {
        //跳转到朋友圈界面
        MomentController *momentVc = [[MomentController alloc] init];
        momentVc.view.backgroundColor = [UIColor greenColor];
        momentVc.urlStr = subStr;
        [nav pushViewController:momentVc animated:YES];

   }else if([url.absoluteString containsString:@"wechat://contacts"]) {
        //调转到联系人界面
        ContactsController *contactsVc = [[ContactsController alloc] init];
        contactsVc.view.backgroundColor = [UIColor redColor];
        [nav pushViewController:contactsVc animated:YES];
    }
    return YES;
}



@end
