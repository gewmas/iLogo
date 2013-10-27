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

@end

@implementation OneParameterExpression

@synthesize expression;

- (id)initWithParameter:(NSMutableArray*)commandList
{
    return [super initWithParameter:commandList];
}

- (void)convert:(NSMutableArray*)commandList
{
    [commandList removeObjectAtIndex:0];
    
    expression = (Expression*)[[VariableExpression alloc] initWithParameter:commandList];
}

@end
