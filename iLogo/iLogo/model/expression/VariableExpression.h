//
//  VariableExpression.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Expression.h"

@interface VariableExpression : Expression

- (id)initWithParameter:(NSArray*)commandList;
- (double)value;

@end
