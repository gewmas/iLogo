//
//  Expression.h
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Expression : NSObject

- (id)initWithParameter:(NSArray*)commandList;
- (void)convert:(NSArray*)commandList;

@end