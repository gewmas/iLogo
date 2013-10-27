//
//  RepeatExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/27/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "RepeatExpression.h"
#import "VariableExpression.h"

#import "Parser.h"

@implementation RepeatExpression

- (void)convert:(NSMutableArray*)commandList
{
    //repeat 360 [ fd 1 rt 1 ]
    [commandList removeObjectAtIndex:0];
    
   
    
    // find [ ]
    int openBracketIndex = -1;
    int closeBracketIndex = -1;
    int bracketNumber = 0;
    
    for(int i = 0; i < [commandList count]; i++){
        NSString *s = commandList[i];
        if([s isEqualToString:@"["]){
            if(openBracketIndex == -1){
                openBracketIndex = i;
            }
            bracketNumber++;
        }else if([s isEqualToString:@"]"]){
            bracketNumber--;
            if(bracketNumber == 0){
                closeBracketIndex = i;
                break;
            }
        }
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    //isNum
    if([formatter numberFromString:[commandList firstObject]]){
        variableExpression = (Expression*)[[VariableExpression alloc] initWithParameter:commandList andModel:[self model]];
    }
    else{    //notNum
        
        
    }
    
    //within [ ... ]
    if (commandExpression == nil) {
        commandExpression = [[NSMutableArray alloc] init];
    }
    NSMutableArray *expression2CmdList = [[NSMutableArray alloc] initWithArray:[commandList subarrayWithRange:NSMakeRange(openBracketIndex, closeBracketIndex-openBracketIndex-1)]];
    while ([expression2CmdList count] != 0) {
        [commandExpression addObject: [[self parser] parse:expression2CmdList]];
    }
    
    //remove [ ... ]
    for(int i = 0; i < closeBracketIndex; i++){
        [commandList removeObjectAtIndex:0];
    }
    
}

- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCmd
{
    NSMutableArray* turtleCommands = [[NSMutableArray alloc] init];
    TurtleCommand *lastTurtleCommand = lastTurtleCmd;
    
    VariableExpression *v = (VariableExpression*)variableExpression;
    double value = [v value];
    
    for(int i = 0; i < value; i++){
        for(Expression *expression in commandExpression){
            NSMutableArray *tmpTurtleCommands = [expression evaluate:lastTurtleCommand];
            if ([tmpTurtleCommands count] != 0) {
                lastTurtleCommand = [tmpTurtleCommands lastObject];
            }
            
            for (TurtleCommand *tc in tmpTurtleCommands){
                [turtleCommands addObject:tc];
            }
            
        }
    }
    
    return turtleCommands;
}


@end
