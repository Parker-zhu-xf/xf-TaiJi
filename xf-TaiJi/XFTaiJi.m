//
//  XFTaiJi.m
//  xf-TaiJi
//
//  Created by 朱晓峰 on 16/8/10.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "XFTaiJi.h"

@implementation XFTaiJi
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.currentIndex=0.0;
        self.backgroundColor=[UIColor clearColor];
        self.timer=[NSTimer scheduledTimerWithTimeInterval:1.0f/32.0f target:self selector:@selector(updateSoptlight) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)updateSoptlight{
    self.currentIndex+=0.01;
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    float x=self.frame.size.width/2;
    float y=self.frame.size.height/2;
    float radius=self.frame.size.width/2;
    if (self.frame.size.width>self.frame.size.height) {
        radius=self.frame.size.height/2;
    }
    float runAngle=M_PI*_currentIndex;
    if (runAngle>=2*M_PI) {
        runAngle-=2*M_PI;
        
    }
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGColorRef whiteColor=[[UIColor colorWithRed:1 green:1 blue:1 alpha:1]CGColor];
    CGColorRef blackColor=[[UIColor colorWithRed:0 green:0 blue:0 alpha:1]CGColor];
    
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x, y, radius, 0+runAngle, M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x, y, radius, M_PI+runAngle, 2*M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/2, M_PI +runAngle, M_PI*2+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/2, 0 +runAngle, M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextMoveToPoint(context, x+radius*cos(runAngle), y+radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, blackColor);
    CGContextMoveToPoint(context, x-radius*cos(runAngle), y-radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y);
    CGContextStrokePath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/4, 0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/4, 0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    
    
}


@end
