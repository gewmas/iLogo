//
//  Model.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Model.h"
#import "Parser.h"

@interface Model()

@property (nonatomic) Parser* parser;

@end

@implementation Model

@synthesize parser = _parser;

- (id)init
{
    self = [super init];
    
    if(self){
        _parser = [[Parser alloc] init];
    }
    
    return self;
}

- (void)updateTrace:(NSString*)userInput
{
    NSArray *splitArray = [userInput componentsSeparatedByString:@" "];

    NSMutableArray *expressionList = [_parser execute:splitArray];
    
}


@end
