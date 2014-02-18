//
//  ABAppDelegate.m
//  airbug
//
//  Created by Richard Shin on 2/12/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import "ABAppDelegate.h"
#import <Crashlytics/Crashlytics.h>
#import "AFNetworkActivityIndicatorManager.h"

@implementation ABAppDelegate

#pragma mark - Protocol conformance
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Crashlytics startWithAPIKey:@"cd2558e2905809b2dbd3b71c6161d2733f40d3d3"];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    self.keychainStore = [[ABKeychainStore alloc] init];
    
    ABLoginViewController *initialViewController = [[ABLoginViewController alloc] init];
    initialViewController.delegate = self;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = initialViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

NSString * const AuthenticationTokenKey = @"AuthenticationTokenKey";

- (void)storeAuthenticationToken:(NSString *)token {
    if (token) {
        [self.keychainStore setString:token forKey:AuthenticationTokenKey];
    }
}

- (NSString *)getAuthenticationToken {
    return [self.keychainStore stringForKey:AuthenticationTokenKey];
}

#pragma mark ABLoginViewControllerDelegate

- (void)loginViewController:(id)viewController didReceiveToken:(NSString *)token
{
    NSLog(@"Received authentication token! %@", token);
    [self storeAuthenticationToken:token];
}

@end
