//
//  ABAppDelegate.h
//  airbug
//
//  Created by Richard Shin on 2/12/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABLoginViewController.h"
#import "ABKeychainStore.h"

@interface ABAppDelegate : UIResponder <UIApplicationDelegate, ABLoginViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 An abstraction for storing sensitive data in the Keychain.
 */
@property (strong, nonatomic) ABKeychainStore *keychainStore;

@end
