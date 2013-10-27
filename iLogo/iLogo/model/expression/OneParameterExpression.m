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

- (id)initWithParameter:(NSMutableArray*)commandList andModel:(Model*)myModel;
{
    return [super initWithParameter:commandList andModel:myModel];
}

- (void)convert:(NSMutableArray*)commandList
{
    [commandList removeObjectAtIndex:0];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    //isNum
    if([formatter numberFromString:[commandList firstObject]]){
        expression = (Expression*)[[VariableExpression alloc] initWithParameter:commandList andModel:[self model]];
    }
    else{    //notNum
        
        
    }
    

    
}

@end
