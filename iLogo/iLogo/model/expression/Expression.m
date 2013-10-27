//
//  Expression.m
//  iLogo
//
//  Created by Yuhua Mai on 10/26/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Expression.h"
#import "Model.h"
#import "Parser.h"


//@class Model;
//@class Parser;

@interface Expression()

@property (nonatomic) Model *model;
@property (nonatomic) Parser *parser;

@end

@implementation Expression

@synthesize model = _model;
@synthesize parser = _parser;

- (id)initWithParameter:(NSMutableArray*)commandList  andModel:(Model*)myModel
{
    self = [super init];
    
    if (self) {
        _model = myModel;
        _parser = [_model parser];
        
        [self convert:commandList];
    }
    
    return self;
}

- (Model*)model
{
    return _model;
}

- (Parser*)parser
{
    return _parser;
}


@end
