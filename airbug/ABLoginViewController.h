//
//  ABLoginViewController.h
//  airbug
//
//  Created by Richard Shin on 2/12/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ABLoginViewControllerDelegate <NSObject>
/**
 Required to receive authentication token on successful login.
 */
- (void)loginViewController:(ABLoginViewController *)viewController didReceiveToken:(NSString *)token;
@end

@interface ABLoginViewController : UIViewController <UIWebViewDelegate>

/**
 The object that receives the authentication token on successful login.
 */
@property (weak, nonatomic) id <ABLoginViewControllerDelegate> delegate;

@end
