//
//  Parser.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Parser.h"

@interface Parser ()

@property (nonatomic) Model *model;

@end

@implementation Parser

- (id)initWithModel:(Model*)model
{
    self = [super init];
    
    if(self){
        _model = model;
    }
    
    return self;
}

- (NSMutableArray *)execute:(NSMutableArray*)commandInput
{
    NSMutableArray *expressionList = [[NSMutableArray alloc] init];
    
    while ([commandInput count] != 0) {
        Expression *parsedExpression = [self parse:commandInput];
        [expressionList addObject:parsedExpression];
    }
    
    return expressionList;
}

- (Expression *)parse:(NSMutableArray*)commandInput
{
    NSString *s = [[commandInput firstObject] lowercaseString];
    
    if ([s isEqualToString:@"fd"]) {
        return [[ForwardExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    else if ([s isEqualToString:@"bk"]) {
        return [[BackExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    else if([s isEqualToString:@"rt"]){
        return [[RightExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    else if([s isEqualToString:@"lt"]){
        return [[LeftExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    
    else if([s isEqualToString:@"repeat"]){
        return [[RepeatExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    
    else if([s isEqualToString:@"home"]){
        return [[HomeExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    else if([s isEqualToString:@"cs"]){
        return [[ClearScreenExpression alloc] initWithParameter:commandInput andModel:_model];
    }
    
    @throw [NSException exceptionWithName:@"Wrong Command" reason:@"Can't find such command." userInfo:nil];
    
    return nil;
}

@end
