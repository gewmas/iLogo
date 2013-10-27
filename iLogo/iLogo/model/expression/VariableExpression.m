//
//  VariableExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "VariableExpression.h"

@interface VariableExpression ()

@property (nonatomic) double value;

@end

@implementation VariableExpression

- (id)initWithParameter:(NSArray*)commandList
{
    self = [super init];
    
    if (self) {
        _value = [[commandList firstObject] doubleValue];
    }
    
    return self;
}

@end
