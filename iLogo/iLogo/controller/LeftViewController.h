//
//  MenuViewController.h
//  iLogo
//
//  Created by Yuhua Mai on 10/27/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iLogoViewController;
@class LeftViewController;
@class MainViewController;

@protocol LeftViewControllerDelegate <NSObject>

- (void)addMainViewController : (MainViewController*)controller;

@end

@interface LeftViewController : UITableViewController

@property (nonatomic, weak) id <LeftViewControllerDelegate> delegate;

- (id)initWithDefaultMainViewController:(MainViewController*)mainViewController forDelegate:(id<LeftViewControllerDelegate>)delegate;

@end
