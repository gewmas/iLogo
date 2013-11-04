//
//  ClearScreenExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 11/3/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "ClearScreenExpression.h"
#import "Turtle.h"


@implementation ClearScreenExpression

- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand;
{
    NSMutableArray* turtleCommands = [[NSMutableArray alloc] init];
    
    TurtleCommand *turtleCommand = [[TurtleCommand alloc] init];
    [turtleCommands addObject:turtleCommand];
    
    return turtleCommands;
}

@end
