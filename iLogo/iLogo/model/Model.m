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

- (void)updateTrace:(NSString*)userInput andActiveTurtles:(NSMutableArray*)activeTurtles
{
    
    userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *array = [userInput componentsSeparatedByString:@" "];
    NSMutableArray *splitArray = [[NSMutableArray alloc] initWithArray:array];

    NSMutableArray *expressionList = [_parser execute:splitArray];
    
    [self createTraceForTurtles:expressionList andActiveTurtles:activeTurtles];
}

- (void)createTraceForTurtles:(NSMutableArray*)expressionList andActiveTurtles:(NSMutableArray*)activeTurtles
{
    for(Turtle *activeTurtle in activeTurtles){
        for(Expression* expression in expressionList){
            if ([expression isMemberOfClass:[ClearScreenExpression class]]) {
                [activeTurtle clearTurtleTrace];
            }
            
            NSMutableArray *turtleCommands = [expression evaluate:[activeTurtle getLastCommand]];
            
            for(TurtleCommand* turtleCommand in turtleCommands){
                [activeTurtle addTurtleCommand:turtleCommand];
            }
        }
    }

}




@end
