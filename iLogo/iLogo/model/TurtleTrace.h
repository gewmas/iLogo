//
//  TurtleTrace.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurtleCommand.h"

@interface TurtleTrace : NSObject


- (NSMutableArray *)turtleCommand;
- (void)addTurtleCommand:(TurtleCommand *)turtleCommand;

@end
