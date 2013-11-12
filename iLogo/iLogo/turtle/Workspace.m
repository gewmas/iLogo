//
//  Workspace.m
//  iLogo
//
//  Created by Yuhua Mai on 11/11/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Workspace.h"
#import "Turtle.h"

@interface Workspace ()

@property (nonatomic) NSMutableArray *turtles;

@end

@implementation Workspace

@synthesize turtles = _turtles;
@synthesize activeTurtles = _activeTurtles;

- (id)init
{
    self = [super init];
    
    if(self){
        _turtles = [[NSMutableArray alloc] init];
        _activeTurtles = [[NSMutableArray alloc] init];
        //at least one turtle in turtles
        [self addTurtle:[[Turtle alloc] init]];
    }
    
    return self;
}

- (void)addTurtle:(Turtle*)turtle
{
    [_turtles addObject:turtle];
    [_activeTurtles addObject:turtle];
}



@end
