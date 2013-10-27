//
//  TurtleCommand.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "TurtleCommand.h"

@interface TurtleCommand ()

@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double direction;

@end

@implementation TurtleCommand

@synthesize x = _x;
@synthesize y = _y;
@synthesize direction = _direction;

- (id)init
{
    self = [super init];
    if (self) {
        _x = [[UIScreen mainScreen] bounds].size.width/2;
        _y = [[UIScreen mainScreen] bounds].size.height*2/3;
        _direction = -90.0;
    }
    return self;
}

- (id)initWithTurtleCommand:(TurtleCommand*)turtleCommand
{
    self = [self init];
    if (self) {
        _x = [turtleCommand x];
        _y = [turtleCommand y];
        _direction = [turtleCommand direction];
    }
    return self;
}

- (id)initWithParameter:(double)x andY:(double)y
{
    self = [self init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

- (double)x
{
    return _x;
}

- (void)setX:(double)x;
{
    _x = x;
}

- (double)y
{
    return _y;
}

- (void)setY:(double)y
{
    _y = y;
}

- (double)direction
{
    return _direction;
}

- (void)setDirection:(double)direction
{
    _direction = direction;
}


@end
