//
//  MyView.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "MyView.h"

@implementation MyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	//绘制直线
//  CGContextRef context = UIGraphicsGetCurrentContext();
//  CGContextSetRGBStrokeColor(context, 255.0f, 255.0f, 255.0f, 1.0f);
//	CGContextSetLineWidth(context, 2.0f);
//	CGContextMoveToPoint(context, 10.0f, 10.0f);
//	CGContextAddLineToPoint(context, 50.0f, 200.0f);
//	CGContextStrokePath(context);
	
	//绘制矩形
//	CGContextRef context = UIGraphicsGetCurrentContext();
//	CGContextSetRGBStrokeColor(context, 255.0f, 255.0f, 255.0f, 1.0f);
//	CGContextSetLineWidth(context, 2.0f);
//	CGContextMoveToPoint(context,10.0f, 10.0f);
//	CGContextAddRect(context, CGRectMake(20.0f, 20.0f, 200.0f, 200.0f));
//	CGContextStrokePath(context);
	
	//绘制圆
//	CGContextRef context = UIGraphicsGetCurrentContext();
//	CGContextSetRGBStrokeColor(context, 255.0f, 255.0f, 255.0f, 1.0f);
//	CGContextSetLineWidth(context, 1.0f);
//	//圆心，半径，弧度，顺时针or逆时针
//	CGContextAddArc(context, 145.0f, 145.0f, 90.0f, 0, 360*(M_PI/180), 1);
//	CGContextStrokePath(context);
	
	//绘制路径
//	CGContextRef context=UIGraphicsGetCurrentContext();
//	CGContextSetRGBStrokeColor(context, 255.0f, 255.0f, 255.0f, 255.0f);
//	CGContextSetLineWidth(context, 2.0f);
//	CGFloat x = 10.0f;
//	CGFloat y = 10.0f;
//	CGContextMoveToPoint(context, x, y);
//	for (int i = 0; i < 30; i++) {
//		if (i % 2 == 0) {
//			x+=10;
//		}else if(i % 2 == 1){
//			y+=10;
//		}
//		CGContextAddLineToPoint(context, x, y);
//	}
//	CGContextStrokePath(context);
}
@end
