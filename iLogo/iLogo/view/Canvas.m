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

@property (nonatomic) NSMutableArray *turtles;
@property (nonatomic) NSMutableDictionary *animationViews;
@property (nonatomic) UIImageView *currentAnimationView;

@property (nonatomic) DIRECTION d;

@end

@implementation Canvas

@synthesize turtles = _turtles;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _animationViews = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)updateTurtles:(NSMutableArray*)turtles
{
    //clear previous view
    for(UIImageView *imageView in _animationViews){
        [imageView removeFromSuperview];
    }
    
    _turtles = turtles;
}

- (void)drawRect:(CGRect)rect {
    for(Turtle *turtle in _turtles){
        [self drawTurtle:turtle andIndex:[NSString stringWithFormat:@"%lu", (unsigned long)[_turtles indexOfObject:turtle]]];
    }
}

- (void)drawTurtle:(Turtle*)turtle andIndex:(NSString*)index{
    NSMutableArray *turtleCommand = [[turtle turtleTrace] turtleCommand];
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
    
    //check current turtle has previous animationivew
    UIImageView *imageView = _animationViews[index];
    if (imageView != nil) {
        [imageView removeFromSuperview];
    }
    
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(prevX-16, prevY-16,32, 32)];
    [_animationViews setValue:imageView forKey:index];
    
    imageView.animationImages=animationArray;
    imageView.animationDuration=1.5;
    imageView.animationRepeatCount=0;
    [imageView startAnimating];
    [self addSubview:imageView];
 
}


@end
