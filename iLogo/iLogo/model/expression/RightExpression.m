//
//  RightExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "RightExpression.h"
#import "VariableExpression.h"

//@class VariableExpression;

@implementation RightExpression

- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand
{
    NSMutableArray* turtleCommands = [[NSMutableArray alloc] init];
    
    VariableExpression *variableExpression = (VariableExpression*)self.expression;
    double value = [variableExpression value];
    
    TurtleCommand *turtleCommand = [[TurtleCommand alloc] initWithTurtleCommand:lastTurtleCommand];
    
    double direction = [turtleCommand direction] + value;
    if (direction > 180) {
        direction -= 360;
    }else if(direction < -180){
        direction += 360;
    }
    
    [turtleCommand setDirection: direction];
    
    [turtleCommands addObject:turtleCommand];
    
    return turtleCommands;
}

@end
