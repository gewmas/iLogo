//
//  Expression.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TurtleCommand.h"
//#import "Model.h"
//#import "Parser.h"

@class Model;
@class Parser;

@interface Expression : NSObject
{
    
}

//@property (nonatomic) Model *model;
//@property (nonatomic) Parser *parser;

- (id)initWithParameter:(NSMutableArray*)commandList andModel:(Model*)model;
- (void)convert:(NSMutableArray*)commandList;
- (NSMutableArray*)evaluate:(TurtleCommand*)lastTurtleCommand;

- (Model*)model;
- (Parser*)parser;

@end
