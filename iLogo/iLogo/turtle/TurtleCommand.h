//
//  TurtleCommand.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TurtleCommand : NSObject

- (id)initWithTurtleCommand:(TurtleCommand*)turtleCommand;
- (id)initWithParameter:(double)x andY:(double)y;
- (double)x;
- (void)setX:(double)x;
- (double)y;
- (void)setY:(double)y;
- (double)direction;
- (void)setDirection:(double)direction;

@end
