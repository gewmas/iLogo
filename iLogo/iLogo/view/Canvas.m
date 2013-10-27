//
//  draw2D.m
//  iLogo
//
//  Created by Yuhua Mai on 10/8/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Canvas.h"

@interface Canvas()

@property (nonatomic) int val;
@property (nonatomic) Turtle *turtle;

@end

@implementation Canvas

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)test
{
    NSLog(@"Canvas Test!");
}

- (void) setNum : (int)temp
{
    _val = temp;
}

- (void)drawTurtle:(Turtle*)turtle
{
    _turtle = turtle;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSMutableArray *turtleCommand = [[_turtle turtleTrace] turtleCommand];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);

    double prevX = [turtleCommand[0] x];
    double prevY = [turtleCommand[0] y];
    double currX = 0;
    double currY = 0;
    
    for (int i = 1; i <= [turtleCommand indexOfObject:[turtleCommand lastObject]]; i++){
        currX = [turtleCommand[i] x];
        currY = [turtleCommand[i] y];
        
        CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
        CGContextMoveToPoint(context, prevX, prevY);
        CGContextAddLineToPoint(context, currX, currY);
        CGContextStrokePath(context);
        
        prevX = currX;
        prevY = currY;
    }
    
//    //test
//    int x = 10, y = 10;
//    int x2, y2, x3, y3,x4, y4;
//    x2 = 50;
//    y2 = 100;
//    x3 = 200;
//    y3 = 200;
//    x4 = 200;
//    y4 = 50;
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 10);
//    
//    // line 1
//    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
//    CGContextMoveToPoint(context, _val, y);
//    CGContextAddLineToPoint(context, x2, y2);
//    CGContextStrokePath(context);
//    
//    // line 2
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, x, y);
//    CGContextAddLineToPoint(context, x3, y3);
//    CGContextStrokePath(context);
//    
//    // line 3
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextMoveToPoint(context, x, y);
//    CGContextAddLineToPoint(context, x4, y4);
//    CGContextStrokePath(context);
    
//    NSLog(@"%d,%d--%d,%d--%d,%d",x2,y2,x3,y3,x4,y4);
}


@end
