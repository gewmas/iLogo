//
//  TurtleCommand.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TurtleCommand : NSObject


- (id)initWithParameter:(double)x andY:(double)y;
- (double)x;
- (double)y;

@end
