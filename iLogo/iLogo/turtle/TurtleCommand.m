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

@end

@implementation TurtleCommand

- (id)init
{
    self = [super init];
    if (self) {
        _x = 0;
        _y = 0;
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

- (double)y
{
    return _y;
}

@end
