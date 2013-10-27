//
//  RepeatExpression.h
//  iLogo
//
//  Created by Yuhua Mai on 10/27/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "ScopedExpression.h"
//#import "Expression.h"

@interface RepeatExpression : ScopedExpression
{
    Expression *variableExpression;
    NSMutableArray *commandExpression;
}



- (void)convert:(NSMutableArray*)commandList;
- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand;


@end
