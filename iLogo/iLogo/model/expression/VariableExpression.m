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

- (id)initWithParameter:(NSMutableArray*)commandList  andModel:(Model*)myModel;
{
    self = [super initWithParameter:commandList andModel:myModel];
    
    if (self) {
        
        
    }
    
    return self;
}

- (void)convert:(NSMutableArray*)commandList
{
    NSString *s = [commandList firstObject];
    _value = [s doubleValue];
    
    [commandList removeObjectAtIndex:0];
}

- (double)value
{
    return _value;
}



@end
