//
//  ForwardExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "BackExpression.h"
#import "VariableExpression.h"
#import "TurtleCommand.h"

@implementation BackExpression

//- (id)initWithParameter:(NSArray*)commandList;
- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand
{
    NSMutableArray* turtleCommands = [[NSMutableArray alloc] init];
    
    VariableExpression *variableExpression = (VariableExpression*)self.expression;
    double value = [variableExpression value];
    
    TurtleCommand *turtleCommand = [[TurtleCommand alloc] initWithTurtleCommand:lastTurtleCommand];
    [turtleCommand setX:[turtleCommand x] - value*cos([turtleCommand direction]*M_PI/180)];
    [turtleCommand setY:[turtleCommand y] - value*sin([turtleCommand direction]*M_PI/180)];
    
    [turtleCommands addObject:turtleCommand];
    
    return turtleCommands;
}

@end
