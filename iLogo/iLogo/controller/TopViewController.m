//
//  TopViewController.m
//  iLogo
//
//  Created by Yuhua Mai on 10/27/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "TopViewController.h"
#import "Canvas.h"

#import "Turtle.h"
#import "TurtleTrace.h"
#import "TurtleCommand.h"

#import "Model.h"

@interface TopViewController ()
{
    double canvasRatio;
}

@property (nonatomic, retain) Canvas *canvas;
@property (nonatomic, retain) UITextField *commentTextField;
@property (nonatomic) NSString *command;
@property (nonatomic) UIButton *button;

@property (nonatomic) Turtle *turtle;

@property (nonatomic) double yPositionStore;

@property (nonatomic) Model *model;

@end

@implementation TopViewController

//view
@synthesize canvas = _canvas;
@synthesize commentTextField = _commentTextField;
@synthesize button = _button;

//model
@synthesize model = _model;
@synthesize turtle = _turtle;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.view = [[Canvas alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.view.backgroundColor = [UIColor purpleColor];
    }
    
    return self;
}

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
    
    canvasRatio = 0.9;
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    self.view.backgroundColor = [UIColor blueColor];
    
    //canvas to draw turtle and trace
    _canvas = [[Canvas alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height*canvasRatio)];
    _canvas.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_canvas];
    
    //button for textfield to touch
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [_button addTarget:self action:@selector(bgTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button]; //now _button above canvas!!!
    
    //keyboard textfield
    _commentTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height*canvasRatio, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height*(1-canvasRatio))];
    _commentTextField.backgroundColor = [UIColor whiteColor];
    _commentTextField.frame = CGRectMake(10, [[UIScreen mainScreen] bounds].size.height*canvasRatio+10, [[UIScreen mainScreen] bounds].size.width-20, [[UIScreen mainScreen] bounds].size.height*(1-canvasRatio)-20);
    [_commentTextField setBorderStyle:UITextBorderStyleRoundedRect];
    _commentTextField.delegate = self;
    _commentTextField.placeholder = @"<Enter Command>";
    [_commentTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    [_commentTextField addTarget:self action:@selector(doneEditing:) forControlEvents:(UIControlEventEditingDidEndOnExit)];
    
    [self.view addSubview:_commentTextField];
    
    _model = [[Model alloc] init];
    _turtle = [[Turtle alloc] init];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:100 andY:100]];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:150 andY:100]];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:100 andY:200]];
//    [_turtle addTurtleCommand:[[TurtleCommand alloc] initWithParameter:198 andY:300]];
    
    [_canvas drawTurtle:_turtle];
}

- (void) processCommandList
{
    _command = [_commentTextField text];
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
    
    [_commentTextField setText:@""];
}

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
    
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
    
    _commentTextField.frame = CGRectMake(_commentTextField.frame.origin.x,
                                         300 , //this is just a number to put it above the keyboard
                                         _commentTextField.frame.size.width,
                                         _commentTextField.frame.size.height);
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    [UIView beginAnimations:@"Animate Text Field Up" context:nil];
    [UIView setAnimationDuration:.8];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    _commentTextField.frame = CGRectMake(_commentTextField.frame.origin.x,
                                         _yPositionStore ,
                                         _commentTextField.frame.size.width,
                                         _commentTextField.frame.size.height);
    
    [UIView commitAnimations];
}

-(IBAction) bgTouched:(id) sender {
    NSLog(@"touch bg");
    [_commentTextField resignFirstResponder];
    
    
    if (![[_commentTextField text] isEqualToString:@""]) {
        [self processCommandList];
    }
    
}


@end
