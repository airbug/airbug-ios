//
//  ABAppDelegate.h
//  airbug
//
//  Created by Richard Shin on 2/12/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABLoginViewController.h"

@interface ABAppDelegate : UIResponder <UIApplicationDelegate, ABLoginViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
