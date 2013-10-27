//
//  OneParameterExpression.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Expression.h"



@interface OneParameterExpression : Expression
{
    Expression *expression;
}

@property (nonatomic) Expression *expression;
- (id)initWithParameter:(NSMutableArray*)commandList andModel:(Model*)model;

@end
