//
//  ABLoginViewController.m
//  airbug
//
//  Created by Richard Shin on 2/12/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import "ABLoginViewController.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface ABLoginViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ABLoginViewController

NSString * const LoginURL = @"http://airbug.com/app#login";

#pragma mark - Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *loginURL = [NSURL URLWithString:LoginURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:loginURL];
    
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
}

@end
