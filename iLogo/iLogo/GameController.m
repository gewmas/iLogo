//
//  GameController.m
//  Groupie
//
//  Created by Yuhua Mai on 10/13/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#include "GameController.h"

@interface GameController()
{
    
    IBOutlet UIView *canvas;
}

@property (strong, nonatomic) UIView* canvas;


@end

@implementation GameController

@synthesize canvas;

#pragma init

- (id)init
{
    self = [super init];
    if(self != nil){
        self.canvas = [[Canvas alloc] init];
    }
    return self;
}


@end
