//
//  Model.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Model.h"
#import "Parser.h"

#import "Expression.h"

@interface Model()

@property (nonatomic) Parser* parser;
@property (nonatomic) Turtle *turtle;

@end

@implementation Model

@synthesize parser = _parser;


- (id)init
{
    self = [super init];
    
    if(self){
        _parser = [[Parser alloc] init];
    }
    
    return self;
}

- (void)updateTrace:(NSString*)userInput andTurtle:(Turtle*)turtle
{
    _turtle = turtle;
    
    NSArray *array = [userInput componentsSeparatedByString:@" "];
    NSMutableArray *splitArray = [[NSMutableArray alloc] initWithArray:array];

    NSMutableArray *expressionList = [_parser execute:splitArray];
    
    [self createTraceForTurtles:expressionList];
}

- (void)createTraceForTurtles:(NSMutableArray*)expressionList
{
    
    for(Expression* expression in expressionList){
        NSMutableArray *turtleCommands = [expression evaluate:[_turtle getLastCommand]];
        
        for(TurtleCommand* turtleCommand in turtleCommands){
            [_turtle addTurtleCommand:turtleCommand];
        }
    }
    
}


@end
