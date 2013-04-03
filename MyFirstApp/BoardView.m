//
//  BoardView.m
//  MyFirstApp
//
//  Created by Freedoms on 13-4-3.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "BoardView.h"

@interface BoardView ()
{
	CGFloat _width;
	CGFloat _height;
}
@end
@implementation BoardView

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
- (void)drawRect:(CGRect)rect
{
	_width=rect.size.width;
	_height=rect.size.height;
	
	NSLog(@"_width  %f",_width);
	NSLog(@"_height  %f",_height);
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 0.8f);
	CGContextSetLineWidth(context, 1.0f);
	
	for (int i=0; i<4; i++) {
		CGContextMoveToPoint(context, 0.0f, _height/3*i);
		CGContextAddLineToPoint(context,_width, _height/3*i);
	}
	
	for (int i=0; i<4; i++) {
		CGContextMoveToPoint(context, _width/3*i, 0.0f);
		CGContextAddLineToPoint(context, _width/3*i, _height);
	}
	CGContextStrokePath(context);
}


@end
