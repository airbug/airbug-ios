//
//  ABLoginViewController.m
//  airbug
//
//  Created by Richard Shin on 2/12/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import "ABLoginViewController.h"

@interface ABLoginViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ABLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
