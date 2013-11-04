//
//  ZeroExpression.m
//  iLogo
//
//  Created by Yuhua Mai on 11/3/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "ZeroExpression.h"

@implementation ZeroExpression

- (id)initWithParameter:(NSMutableArray*)commandList andModel:(Model*)myModel;
{
    return [super initWithParameter:commandList andModel:myModel];
}

- (void)convert:(NSMutableArray*)commandList
{
    [commandList removeObjectAtIndex:0];
}

@end
