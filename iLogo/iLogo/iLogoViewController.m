//
//  iLogoViewController.m
//  iLogo
//
//  Created by Yuhua Mai on 10/6/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "iLogoViewController.h"

@interface iLogoViewController ()
{
    IBOutlet UITextField *commentTextField;
}

@property (nonatomic, retain) UITextField *commentTextField;
@property (nonatomic) double yPositionStore;

@end


@implementation iLogoViewController

@synthesize commentTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [commentTextField.]
    NSLog(@"view did load!");
}

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

-(IBAction) bgTouched:(id) sender {
    NSLog(@"touch bg");
    [commentTextField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //keep a member variable to store where the textField started
    _yPositionStore = textField.frame.origin.y;
    
    //If we begin editing on the text field we need to move it up to make sure we can still
    //see it when the keyboard is visible.
    //
    //I am adding an animation to make this look better
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    commentTextField.frame = CGRectMake(commentTextField.frame.origin.x,
                                        300 , //this is just a number to put it above the keyboard
                                        commentTextField.frame.size.width,
                                        commentTextField.frame.size.height);
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    [UIView setAnimationDuration:.8];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    commentTextField.frame = CGRectMake(commentTextField.frame.origin.x,
                                        _yPositionStore ,
                                        commentTextField.frame.size.width,
                                        commentTextField.frame.size.height);
    
    [UIView commitAnimations];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
