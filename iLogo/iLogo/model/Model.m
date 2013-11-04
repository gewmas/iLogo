//
//  Model.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Model.h"

#import "Expression.h"
#import "ClearScreenExpression.h"

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
        _parser = [[Parser alloc] initWithModel:self];
    }
    return self;
}


- (Parser*)parser
{
    return _parser;
}

- (void)updateTrace:(NSString*)userInput andTurtle:(Turtle*)turtle
{
    _turtle = turtle;
    
    userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *array = [userInput componentsSeparatedByString:@" "];
    NSMutableArray *splitArray = [[NSMutableArray alloc] initWithArray:array];

    NSMutableArray *expressionList = [_parser execute:splitArray];
    
    [self createTraceForTurtles:expressionList];
}

- (void)createTraceForTurtles:(NSMutableArray*)expressionList
{
    
    for(Expression* expression in expressionList){
        if ([expression isMemberOfClass:[ClearScreenExpression class]]) {
            [_turtle clearTurtleTrace];
        }
        
        NSMutableArray *turtleCommands = [expression evaluate:[_turtle getLastCommand]];
        
        for(TurtleCommand* turtleCommand in turtleCommands){
            [_turtle addTurtleCommand:turtleCommand];
        }
    }
    
}

- (Turtle*)turtle
{
    return _turtle;
}


@end
