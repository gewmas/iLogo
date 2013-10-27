//
//  Parser.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "ExpressionHeader.h"

@class Model;
@class Expression;

@interface Parser : NSObject

- (id)initWithModel:(Model*)model;
- (NSMutableArray *)execute:(NSMutableArray*)commandInput;
- (Expression *)parse:(NSMutableArray*)commandInput;

@end
