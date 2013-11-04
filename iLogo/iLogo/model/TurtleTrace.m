//
//  TurtleTrace.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "TurtleTrace.h"

@interface TurtleTrace()

@property (nonatomic) NSMutableArray * turtleCommand;



@end

@implementation TurtleTrace

@synthesize turtleCommand = _turtleCommand;

- (id)init
{
    self = [super init];
    if (self) {
        _turtleCommand = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMutableArray *)turtleCommand
{
    return _turtleCommand;
}

- (void)addTurtleCommand:(TurtleCommand *)turtleCommand
{
    [_turtleCommand addObject:turtleCommand];
}

- (void)clearTurtleCommand
{
    [_turtleCommand removeAllObjects];
}

@end
