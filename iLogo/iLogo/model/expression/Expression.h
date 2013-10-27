//
//  Expression.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurtleCommand.h"

@interface Expression : NSObject

- (id)initWithParameter:(NSMutableArray*)commandList;
- (void)convert:(NSMutableArray*)commandList;
- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand;

@end
