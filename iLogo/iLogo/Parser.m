//
//  Parser.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Parser.h"
#import "ExpressionHeader.h"

@implementation Parser

- (NSMutableArray *)execute:(NSArray*)commandInput
{
    NSMutableArray *expressionList = [[NSMutableArray alloc] init];
    
    while ([commandInput count] != 0) {
        Expression *parsedExpression = [self parse:commandInput];
        [expressionList addObject:parsedExpression];
    }
    
    return expressionList;
}

- (Expression *)parse:(NSArray*)commandInput
{
    NSString *s = [commandInput firstObject];
    
    if ([s isEqualToString:@"fd"]) {
        return [[ForwardExpression alloc] initWithParameter:commandInput];
    }else if([s isEqualToString:@"rt"]){
        
    }
    
    return nil;
}

@end
