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
@property (strong, nonatomic) NSString *domain;
@end

@implementation ABLoginViewController

NSString * const LoginURL = @"http://airbug.com/app#login";
NSString * const CookieAuthenticationTokenKey = @"oauth_token";

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadLoginURL];
}

#pragma mark - Private

- (void)loadLoginURL
{
    NSURL *loginURL = [NSURL URLWithString:LoginURL];
    self.domain = [loginURL host];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:loginURL];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

- (NSString *)getTokenFromCookie
{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        if ([[cookie domain] isEqualToString:self.domain]) {
            if ([[cookie name] isEqualToString:CookieAuthenticationTokenKey]) {
                return [cookie value];
            }
        }
    }
    return nil;
}

#pragma mark - Protocol conformance
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
    NSString *token = [self getTokenFromCookie];
    if (token) {
        [self.delegate loginViewController:self didReceiveToken:token];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
}

@end
