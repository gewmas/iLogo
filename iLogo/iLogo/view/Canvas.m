//
//  draw2D.m
//  iLogo
//
//  Created by Yuhua Mai on 10/8/13.
//  Copyright (c) 2013 Yuhua Mai. All rights reserved.
//

#import "Canvas.h"

typedef enum{
    UP=1, DOWN=0, LEFT=3, RIGHT=2
} DIRECTION;

@interface Canvas()

@property (nonatomic) int val;
@property (nonatomic) Turtle *turtle;

@property (nonatomic) UIImageView *animationView;

@property (nonatomic) DIRECTION d;

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
    
    TurtleCommand *lastCommand = [turtleCommand lastObject];
    if ([lastCommand direction] <= -45 && [lastCommand direction] >= -135) {
        _d = UP;
    }else if([lastCommand direction] <= 135 && [lastCommand direction] >= 45){
        _d = DOWN;
    }else if([lastCommand direction] <= 45 && [lastCommand direction] >= -45){
        _d = RIGHT;
    }else{
        _d = LEFT;
    }
    
    UIImage *image = [UIImage imageNamed:@"turtle.png"];
    
    CGRect fromRect = CGRectMake(0, _d*32, 32, 32);
    CGImageRef drawImage = CGImageCreateWithImageInRect(image.CGImage, fromRect);
    UIImage *image1 = [UIImage imageWithCGImage:drawImage];
    
    fromRect = CGRectMake(32, _d*32, 32, 32);
    drawImage = CGImageCreateWithImageInRect(image.CGImage, fromRect);
    UIImage *image2 = [UIImage imageWithCGImage:drawImage];

    fromRect = CGRectMake(64, _d*32, 32, 32);
    drawImage = CGImageCreateWithImageInRect(image.CGImage, fromRect);
    UIImage *image3 = [UIImage imageWithCGImage:drawImage];
    
//    CGImageRelease(drawImage);
    
    NSArray *animationArray=[NSArray arrayWithObjects:
                             image1,
                             image2,
                             image3,
                             nil];
    [_animationView removeFromSuperview];
    _animationView=[[UIImageView alloc]initWithFrame:CGRectMake(prevX-16, prevY-16,32, 32)];
//    _animationView.backgroundColor=[UIColor purpleColor];
    _animationView.animationImages=animationArray;
    _animationView.animationDuration=1.5;
    _animationView.animationRepeatCount=0;
    [_animationView startAnimating];
    [self addSubview:_animationView];
 
}


@end
