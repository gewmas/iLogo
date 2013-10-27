//
//  Expression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Expression.h"

@implementation Expression

- (id)initWithParameter:(NSArray*)commandList
{
    self = [super init];
    
    if (self) {
        [self convert:commandList];
    }
    
    return self;
}




@end
