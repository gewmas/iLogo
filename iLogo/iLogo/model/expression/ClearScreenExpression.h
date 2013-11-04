//
//  ClearScreenExpression.h
//  iLogo
//
//  Created by Yuhua Mai on 11/3/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "ZeroExpression.h"

@interface ClearScreenExpression : ZeroExpression

- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand;

@end
