//
//  Turtle.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "TurtleTrace.h"

@interface Turtle : NSObject

- (TurtleTrace *)turtleTrace;
- (void)addTurtleTrace:(TurtleTrace *)turtleTrace;
- (void)addTurtleCommand:(TurtleCommand *)turtleCommand;

@end
