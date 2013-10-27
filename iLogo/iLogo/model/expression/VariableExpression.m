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

- (id)initWithParameter:(NSMutableArray*)commandList
{
    self = [super init];
    
    if (self) {
        NSString *s = [commandList firstObject];
        _value = [s doubleValue];
        
        [commandList removeObjectAtIndex:0];
    }
    
    return self;
}

- (double)value
{
    return _value;
}

@end
