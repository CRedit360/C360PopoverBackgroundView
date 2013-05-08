//
//  C360AppDelegate.m
//  C360PopoverBackgroundViewDemo
//
//  Created by Simon Booth on 08/05/2013.
//  Copyright (c) 2013 Simon Booth. All rights reserved.
//

#import "C360AppDelegate.h"
#import "C360DemoController.h"

@implementation C360AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    C360DemoController *demoController = [[C360DemoController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:demoController];
    navigationController.toolbarHidden = NO;
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
