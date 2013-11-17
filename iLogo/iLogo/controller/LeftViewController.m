//
//  MenuViewController.m
//  iLogo
//
//  Created by Yuhua Mai on 10/27/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "LeftViewController.h"
#import "MainViewController.h"

@interface LeftViewController ()

@property (nonatomic, strong) NSMutableDictionary *mainViewControllers;

@property (nonatomic) int rowNumber;

@end

@implementation LeftViewController

@synthesize delegate = _delegate;

@synthesize mainViewControllers = _mainViewControllers;
@synthesize rowNumber = _rowNumber;

- (id)initWithDefaultMainViewController:(MainViewController*)mainViewController forDelegate:(id<LeftViewControllerDelegate>)delegate
{
    self = [[LeftViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    if(self){
        _delegate = delegate;
        
        _rowNumber = 2; //1 mainViewController spot + 1 New WorkSpace
        _mainViewControllers = [[NSMutableDictionary alloc] initWithCapacity:_rowNumber];
        _mainViewControllers[@"0"] = mainViewController;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([indexPath row] != _rowNumber-1) {
        [[cell textLabel] setText: [NSString stringWithFormat:@"Workspace %d", indexPath.row]];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        [[cell textLabel] setText:@"New"];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor blueColor];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Assume there is only 1 section
    NSString *currentRow;
    MainViewController *mainViewController = nil;

    //Create New Workspace
    if ([indexPath row] == _rowNumber-1){
        self.rowNumber = self.rowNumber + 1;
        NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.rowNumber-1 inSection:0]];
        [[self tableView] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    currentRow = [NSString stringWithFormat:@"%d", [indexPath row]];
    mainViewController = _mainViewControllers[currentRow];
    if (!mainViewController) {
        mainViewController = [[MainViewController alloc] init];
        _mainViewControllers[currentRow] = mainViewController;
    }
  
    
    if( [_delegate respondsToSelector:@selector(addMainViewController:)]) {
        [_delegate addMainViewController:mainViewController];
    }
    
    [self.tableView reloadData];

}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
