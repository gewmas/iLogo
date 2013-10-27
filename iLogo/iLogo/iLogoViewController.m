//
//  iLogoViewController.m
//  iLogo
//
//  Created by Yuhua Mai on 10/6/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "iLogoViewController.h"
#import "GameController.h"

#import "Canvas.h"

#import "Turtle.h"
#import "TurtleTrace.h"
#import "TurtleCommand.h"

#import "Model.h"

@interface iLogoViewController ()
{
    IBOutlet UITextField *commentTextField;
//    IBOutlet UIView *canvas;
}

//@property (strong, nonatomic) GameController* controller;

@property (nonatomic, retain) Canvas *canvas;

@property (nonatomic, retain) UITextField *commentTextField;
@property (nonatomic) NSString *command;

//@property (nonatomic) TurtleTrace * turtleTrace;
@property (nonatomic) Turtle *turtle;

@property (nonatomic) double yPositionStore;

@property (nonatomic) Model *model;

@end


@implementation iLogoViewController

@synthesize model = _model;

@synthesize canvas = _canvas;
@synthesize turtle = _turtle;

@synthesize commentTextField;

- (id)init
{
    self = [super init];
    if(self != nil){
        _canvas = [[Canvas alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        self.controller = [[GameController alloc] init];
//        _turtleTrace = [[TurtleTrace alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _model = [[Model alloc] init];
    _turtle = [[Turtle alloc] init];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:100 andY:100]];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:150 andY:100]];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:100 andY:200]];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:198 andY:300]];

    [_canvas drawTurtle:_turtle];
    NSLog(@"view did load!");
    
}

- (void) processCommandList
{
    _command = [commentTextField text];
    if ([_command isEqualToString:@""]) {
        return;
    }
    
    NSLog(@"Calling model!");
    [_model updateTrace:_command andTurtle:_turtle];
//    NSArray *splitArray = [_command componentsSeparatedByString:@" "];
    
//    NSLog(@"%@", splitArray);
    
//    NSLog(@"%f, %f", [splitArray[0] doubleValue], [splitArray[1] doubleValue]);
    
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:[splitArray[0] doubleValue] andY:[splitArray[1] doubleValue]]];
//    [_canvas drawTurtle:_turtle];
    
    [_canvas setNeedsDisplay];
    
    [commentTextField setText:@""];
}

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
    
    [self processCommandList];
    
    
}

-(IBAction) bgTouched:(id) sender {
    NSLog(@"touch bg");
    [commentTextField resignFirstResponder];
    
    [self processCommandList];
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
