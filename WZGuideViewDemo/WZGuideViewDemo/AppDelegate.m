//
//  AppDelegate.m
//  WZGuideViewDemo
//
//  Created by chenstone on 15/12/29.
//  Copyright © 2015年 chenstone. All rights reserved.
//

#define ISNOTFIRST [NSString stringWithFormat:@"isNotFirst"]
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]

#import "AppDelegate.h"
#import "WZGuideView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //第一次打开应用
    if(![USERDEFAULTS objectForKey:ISNOTFIRST]){
        [USERDEFAULTS setBool:YES forKey:ISNOTFIRST];
        [WZGuideView showInView: self.window.rootViewController.view];
        NSLog(@"This is the first loading");
    }else{
        NSLog(@"This is not the first loading");
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
