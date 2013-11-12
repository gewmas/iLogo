//
//  Workspace.h
//  iLogo
//
//  Created by Yuhua Mai on 11/11/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Turtle.h"

@interface Workspace : NSObject

@property (nonatomic) NSMutableArray *activeTurtles;

- (void)addTurtle:(Turtle*)turtle;

@end
