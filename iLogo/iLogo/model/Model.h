//
//  Model.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Turtle.h"

@interface Model : NSObject

- (void)updateTrace:(NSString*)userInput andTurtle:(Turtle*)turtle;

@end
