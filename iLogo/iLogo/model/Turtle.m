//
//  Turtle.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Turtle.h"

@interface Turtle()

@property (nonatomic) TurtleTrace * turtleTrace;

@end

@implementation Turtle

@synthesize turtleTrace = _turtleTrace;

- (id)init
{
    self = [super init];
    if (self) {
        _turtleTrace = [[TurtleTrace alloc] init];
    }
    return self;
}

- (TurtleTrace *)turtleTrace
{
    return _turtleTrace;
}

- (void)addTurtleTrace:(TurtleTrace *)turtleTrace
{
    NSMutableArray *turtleCommand = [turtleTrace turtleCommand];
    
    for (TurtleCommand *tc in turtleCommand){
        [_turtleTrace addTurtleCommand:tc];
    }
}

- (void)addTurtleCommand:(TurtleCommand *)turtleCommand
{
    [_turtleTrace addTurtleCommand:turtleCommand];
}

@end
