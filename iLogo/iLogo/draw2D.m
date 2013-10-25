//
//  draw2D.m
//  iLogo
//
//  Created by Yuhua Mai on 10/8/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "draw2D.h"

@implementation draw2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetLineWidth(context, 2.0);
//    
//    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
//    
//    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
//    
//    CGColorRef color = CGColorCreate(colorspace, components);
//    
//    CGContextSetStrokeColorWithColor(context, color);
//    
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 300, 400);
//    
//    CGContextStrokePath(context);
//    CGColorSpaceRelease(colorspace);
//    CGColorRelease(color);
    
    
    //test
    int x = 10, y = 10;
    int x2, y2, x3, y3,x4, y4;
    x2 = 50;
    y2 = 100;
    x3 = 200;
    y3 = 200;
    x4 = 200;
    y4 = 50;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    
    // line 1
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, x2, y2);
    CGContextStrokePath(context);
    
    // line 2
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, x3, y3);
    CGContextStrokePath(context);
    
    // line 3
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, x4, y4);
    CGContextStrokePath(context);
    
    NSLog(@"%d,%d--%d,%d--%d,%d",x2,y2,x3,y3,x4,y4);
}


@end
