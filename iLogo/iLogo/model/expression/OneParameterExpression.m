//
//  OneParameterExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "OneParameterExpression.h"
#import "VariableExpression.h"

@interface OneParameterExpression()

@property (nonatomic) Expression *expression;

@end

@implementation OneParameterExpression

- (id)initWithParameter:(NSArray*)commandList
{
    return [super initWithParameter:commandList];
}

- (void)convert:(NSArray*)commandList
{
    [commandList delete:[commandList firstObject]];
    
    _expression = (Expression*)[[VariableExpression alloc] initWithParameter:[commandList firstObject]];
}

@end
