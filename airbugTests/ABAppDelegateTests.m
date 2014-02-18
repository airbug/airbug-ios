//
//  ABAppDelegateTests.m
//  airbug
//
//  Created by Richard Shin on 2/17/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABAppDelegate.h"
#import "ABLoginViewController.h"
#import <OCMock/OCMock.h>

@interface ABAppDelegateTests : XCTestCase
{
    ABAppDelegate *appDelegate;
}
@end

@implementation ABAppDelegateTests

- (void)testInitialViewControllerAfterLaunchIsLoginViewController
{
    appDelegate = [[ABAppDelegate alloc] init];
    
    [appDelegate application:nil didFinishLaunchingWithOptions:nil];
    
    UIViewController *rootVC = appDelegate.window.rootViewController;
    XCTAssertTrue([rootVC isKindOfClass:[ABLoginViewController class]]);
}

- (void)testAppDelegateWhenLoginIsSuccessfulStoresAuthenticationToken
{
    appDelegate = [[ABAppDelegate alloc] init];
    NSString *authenticationToken = @"abcdefg hijklmnop";
    id mockKeystore = [OCMockObject mockForClass:[ABKeychainStore class]];
    [[mockKeystore expect] setString:authenticationToken forKey:[OCMArg any]];
    appDelegate.keychainStore = mockKeystore;
    
    [appDelegate loginViewController:nil didReceiveToken:authenticationToken];
    
    [mockKeystore verify];
}

@end
