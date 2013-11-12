//
//  TopViewController.m
//  iLogo
//
//  Created by Yuhua Mai on 10/27/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "TopViewController.h"
#import "Canvas.h"

#import "Workspace.h"
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

@property (nonatomic) UILabel *warningLabel;

//command area
@property (nonatomic) NSMutableArray *commandButton;
@property (nonatomic) NSArray *commandName;
@property (nonatomic) UISlider *commandSlider;
@property (nonatomic) UILabel *commandLabel;

@property (nonatomic) NSMutableArray *workspaces;
@property (nonatomic) Workspace *currentWorkspace;
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


//command button
@synthesize commandButton = _commandButton;
@synthesize workspaces = _workspaces;

- (void)setupVariable
{
    _workspaces = [[NSMutableArray alloc] init];
    [_workspaces addObject:[[Workspace alloc] init]];
    _currentWorkspace = [_workspaces objectAtIndex:0];
    
    _model = [[Model alloc] init];
    
    canvasRatio = 0.9;
}

- (void)setupView
{
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
    
    
    //button to execute commands
#define COMMAND_NUMBER 6
#define COMMAND_BUTTON_HEIGHT 48
#define COMMAND_BUTTON_WIDTH [[UIScreen mainScreen] bounds].size.width/COMMAND_NUMBER
    _commandButton = [[NSMutableArray alloc] init];
    _commandName = @[@"fd", @"bk", @"lt", @"rt", @"cs", @"home"];
    
    for (int i = 0; i < [_commandName count]; i++) {
        UIButton *tempButton = [[UIButton alloc] initWithFrame:CGRectMake(COMMAND_BUTTON_WIDTH*i, [[UIScreen mainScreen] bounds].size.height*canvasRatio-COMMAND_BUTTON_HEIGHT*2, COMMAND_BUTTON_WIDTH, COMMAND_BUTTON_HEIGHT)];
        [tempButton setTitle:_commandName[i] forState:UIControlStateNormal];
        [tempButton setBackgroundColor:[UIColor blueColor]];
        [tempButton addTarget:self action:@selector(commandButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tempButton];
        [_commandButton addObject:tempButton];
    }
    
    //button to add turtle
    UIButton *addTurtleButton = [[UIButton alloc] initWithFrame:CGRectMake(COMMAND_BUTTON_WIDTH*0, [[UIScreen mainScreen] bounds].size.height*canvasRatio-COMMAND_BUTTON_HEIGHT*3, COMMAND_BUTTON_WIDTH, COMMAND_BUTTON_HEIGHT)];
    [addTurtleButton setTitle:@"Add" forState:UIControlStateNormal];
    [addTurtleButton setBackgroundColor:[UIColor greenColor]];
    [addTurtleButton addTarget:self action:@selector(createTurtle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addTurtleButton];

    
    //warning label
#define WARNING_LABEL_HEIGHT 48
#define WARNING_LABEL_WIDTH 300
    _warningLabel = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width/2-WARNING_LABEL_WIDTH/2, [[UIScreen mainScreen] bounds].size.height/2-WARNING_LABEL_WIDTH/2, WARNING_LABEL_WIDTH, WARNING_LABEL_HEIGHT)];
    _warningLabel.text = @"Wrong Command!";
    _warningLabel.textColor = [UIColor redColor];
    [_warningLabel setFont:[UIFont systemFontOfSize:26]];
    _warningLabel.backgroundColor = [UIColor clearColor];
    [_warningLabel setTextAlignment:NSTextAlignmentCenter];
    _warningLabel.hidden = YES;
    [self.view addSubview:_warningLabel];
    
    //slider to choose value
#define COMMAND_SLIDER_HEIGHT COMMAND_BUTTON_HEIGHT
#define COMMAND_SLIDER_WIDTH [[UIScreen mainScreen] bounds].size.width*2/3
    _commandSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height*canvasRatio-COMMAND_SLIDER_HEIGHT, COMMAND_SLIDER_WIDTH, COMMAND_SLIDER_HEIGHT)];
    _commandSlider.maximumValue = 200;
    _commandSlider.value = 90;
    [_commandSlider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_commandSlider];
    
    //label to show slider value
#define COMMAND_LABEL_HEIGHT COMMAND_BUTTON_HEIGHT
#define COMMAND_LABEL_WIDTH [[UIScreen mainScreen] bounds].size.width*1/3
    _commandLabel = [[UILabel alloc] initWithFrame: CGRectMake(COMMAND_SLIDER_WIDTH, [[UIScreen mainScreen] bounds].size.height*canvasRatio-COMMAND_SLIDER_HEIGHT, COMMAND_LABEL_WIDTH, COMMAND_LABEL_HEIGHT)];
    _commandLabel.text = [[NSString alloc] initWithFormat:@"%d", (int)_commandSlider.value ];
    [_commandLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_commandLabel];
    
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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupVariable];
    [self setupView];
    [_canvas updateTurtles:[_currentWorkspace activeTurtles]];
}


#pragma mark call model
- (void)callModel
{
    @try {
        [_model updateTrace:_command andActiveTurtles:[_currentWorkspace activeTurtles]];
    }
    @catch (NSException *exception) {
         _warningLabel.hidden = NO;
        
        [NSTimer scheduledTimerWithTimeInterval:2
                                         target:self
                                       selector:@selector(handleTimer:)
                                       userInfo:nil
                                        repeats:NO];
    }
    @finally {
        [_canvas setNeedsDisplay];
    }
}

-(void)handleTimer: (NSTimer *) timer
{
    _warningLabel.hidden = YES;

}

#pragma mark textfiled input
- (void) processCommandList
{
    _command = [_commentTextField text];
    if ([_command isEqualToString:@""]) {
        return;
    }
    
    [self callModel];
    
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

#pragma mark command delegate function

-(IBAction) bgTouched:(id) sender {
    NSLog(@"touch bg");
    [_commentTextField resignFirstResponder];
    
    
    if (![[_commentTextField text] isEqualToString:@""]) {
        [self processCommandList];
    }
}

-(IBAction)commandButtonTouched:(UIButton*)sender
{
    NSString *title = sender.titleLabel.text;
    _command = title;
    
    if (![title isEqualToString:@"cs"] && ![title isEqualToString:@"home"]) {
        _command = [title stringByAppendingString:[[NSString alloc] initWithFormat:@" %d", (int)_commandSlider.value]];
    }
    
    [self callModel];
}

-(IBAction)sliderValueChange:(UISlider*)sender
{
    _commandLabel.text = [[NSString alloc] initWithFormat:@"%d", (int)_commandSlider.value];
}

-(IBAction)createTurtle:(id)sender
{
    [_currentWorkspace addTurtle:[[Turtle alloc] init]];
    [_canvas setNeedsDisplay];
}

@end
