//
//  iLogoViewController.m
//  iLogo
//
//  Created by Yuhua Mai on 10/6/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "iLogoViewController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

#import "GameController.h"



@interface iLogoViewController () <SCSlidingViewControllerDelegate, LeftViewControllerDelegate>


@end


@implementation iLogoViewController

- (id)init
{
    self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Customizing the top view
    self.topViewOffsetY = 0;
    
    //usage:[[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    MainViewController *mainController = [self.storyboard instantiateViewControllerWithIdentifier:@"Top"];
    self.topViewController = mainController;
    self.leftSideViewController = [[LeftViewController alloc] initWithDefaultMainViewController:mainController forDelegate:self];
//    self.rightSideViewController = [[RightViewController alloc] initWithStyle:UITableViewStyleGrouped];
    

    
    /*
    //swip
   UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandle:)];
   rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
   [rightRecognizer setNumberOfTouchesRequired:1];
   //add the your gestureRecognizer , where to detect the touch..
   [self.view addGestureRecognizer:rightRecognizer];

   UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeHandle:)];
   leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
   [leftRecognizer setNumberOfTouchesRequired:1];
   [self.view addGestureRecognizer:leftRecognizer];
     */
    
    NSLog(@"view did load!");
}


/*
#pragma touch
- (void)rightSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
   NSLog(@"rightSwipeHandle");
   [self changeTopViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Menu"]];
   [self slideLeft];
}

- (void)leftSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
   NSLog(@"leftSwipeHandle");
   [self changeTopViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Context"]];
   [self slideRight];
}
*/

#pragma mark delegate method
- (void)addMainViewController : (MainViewController*)controller
{
    self.topViewController = controller;
}


@end
