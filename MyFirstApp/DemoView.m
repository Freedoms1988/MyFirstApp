//
//  DemoView.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "DemoView.h"
#define kDD_DATE @"d"
#define kINTERVAL 86400 //24*60*60
@interface DemoView() {
	NSDateFormatter *_dateFormatter;
	NSCalendar *_calendar;
	NSDateComponents *_components;
	NSInteger _dayArraySize;
	CGFloat _width;
	CGFloat _height;
}

@end
@implementation DemoView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//圆角矩形，填充
//右边，下边坐标系
//横向虚线，标尺200
//一个月内峰值，谷值，纵向范围
//一个月时间，横向范围
//横屏竖屏分别判断求坐标系
-(id)initWithFrame:(CGRect)frame
{
	self=[super initWithFrame:frame];
	if (self) {
		_dateFormatter=[[NSDateFormatter alloc]init];
		[_dateFormatter setDateFormat:kDD_DATE];
		_calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
		_components=[[NSDateComponents alloc]init];
		//拖拽
		UIPanGestureRecognizer *panGestureRecognizer=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerAction:)];
		[self addGestureRecognizer:panGestureRecognizer];
		Freedoms_Release(panGestureRecognizer);
		//缩放
		UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizerAction:)];
		[self addGestureRecognizer:pinchGestureRecognizer];
		Freedoms_Release(pinchGestureRecognizer);
		UITapGestureRecognizer *oneGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
		[oneGestureRecognizer setNumberOfTapsRequired:1];//几次点击
		[oneGestureRecognizer setNumberOfTouchesRequired:1];//几根手指
		[self addGestureRecognizer:oneGestureRecognizer];
		Freedoms_Release(oneGestureRecognizer);
		UITapGestureRecognizer *twoGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
		[twoGestureRecognizer setNumberOfTapsRequired:1];//几次点击
		[twoGestureRecognizer setNumberOfTouchesRequired:2];//几根手指
		[self addGestureRecognizer:twoGestureRecognizer];
		Freedoms_Release(twoGestureRecognizer);
	}
	return self;
}

- (void)setFrame:(CGRect)frame
{
	[super setFrame:frame];
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
	//准备数据
	_width=rect.size.width;
	_height=rect.size.height;
	CGFloat radius=10.0f;
	CGContextRef context=UIGraphicsGetCurrentContext();
	_dayArraySize=[_dayArray count];//数据总数
	NSInteger r=_dayArraySize/5+1;
	int p=0;
	if (rect.size.height==414&&rect.size.width==318) {//纵向
		p=1;
	}
	//排序
	NSArray *sortedArray=[_dayArray sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2){
		if([obj1 floatValue]>[obj2 floatValue]){
			return NSOrderedDescending;
		}
		if ([obj1 floatValue]<[obj2 floatValue]) {
			return NSOrderedAscending;
		}
		return NSOrderedSame;
	}];
	int minValue=[[sortedArray objectAtIndex:0] intValue];
	int maxValue=[[sortedArray objectAtIndex:_dayArraySize-1] intValue];
	
	//绘制背景
	CGContextSetRGBStrokeColor(context, 27.0f/255, 45.0f/255, 91.0f/255, 0.8f);
	CGContextSetLineWidth(context, 1.0f);
	CGContextMoveToPoint(context, radius+1, 1);
    CGContextAddLineToPoint(context, _width - radius-1, 1);
    CGContextAddArc(context, _width - radius, radius, radius-1, -0.5*M_PI, 0.0, 0);
    CGContextAddLineToPoint(context, _width-1, _height - radius-1);
    CGContextAddArc(context, _width - radius, _height - radius, radius-1, 0.0, 0.5*M_PI, 0);
    CGContextAddLineToPoint(context, radius-1, _height-1);
    CGContextAddArc(context, radius, _height - radius, radius-1, 0.5*M_PI, M_PI, 0);
    CGContextAddLineToPoint(context, 1, radius-1);
    CGContextAddArc(context, radius, radius, radius-1, M_PI, 1.5*M_PI, 0);
    CGContextClosePath(context);
    CGContextSetRGBFillColor(context, 27.0f/255, 45.0f/255, 91.0f/255, 0.8f);
    CGContextDrawPath(context, kCGPathFill);
	//绘制边框
	CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 0.5f);
	CGContextSetLineWidth(context, 2.0f);
	CGContextMoveToPoint(context, radius, 0);
	CGContextAddLineToPoint(context, _width - radius, 0);
	CGContextAddArc(context, _width - radius, radius, radius, -0.5*M_PI, 0.0, 0);
	CGContextAddLineToPoint(context, _width, _height - radius);
    CGContextAddArc(context, _width - radius, _height - radius, radius, 0.0, 0.5*M_PI, 0);
	CGContextAddLineToPoint(context, radius, _height);
    CGContextAddArc(context, radius, _height - radius, radius, 0.5*M_PI, M_PI, 0);
	CGContextAddLineToPoint(context, 0.0, radius);
    CGContextAddArc(context, radius, radius, radius, M_PI, 1.5*M_PI, 0);
	CGContextStrokePath(context);
	//绘制坐标系
	
	if (p==1) {//屏幕纵向
		//横向坐标系
		CGContextSetRGBStrokeColor(context, 78.0f/255, 95.0f/255, 131.0f/255, 0.5f);
		CGContextSetLineWidth(context, 2.0f);
		CGContextMoveToPoint(context,1.0f,_height-_height/18);//最底下横向
		CGContextAddLineToPoint(context, _width-1.0f, _height-_height/18);
		CGContextMoveToPoint(context, 1.0f, _height-_height/6);//第二条横向
		CGContextAddLineToPoint(context, _width-1.0f, _height-_height/6);
		CGContextStrokePath(context);
		//横向虚线
		
		//纵向柱状图
		//第一二条间纵向空间=第一条横向纵坐标-第二条横向纵坐标
		//最大值占满全部，
		//柱状图的长度=每一个数据与最大值的比*第一二条间纵向空间
		//柱状图起始横坐标=纵向坐标系横坐标-纵向坐标系横坐标/dayArraySize*i
		//柱状图起始纵坐标=第二条纵坐标
		//柱状图中止横坐标=纵向坐标系横坐标-纵向坐标系横坐标/dayArraySize*i
		//柱状图中止纵坐标=第二条纵坐标-柱状图长度
		CGContextSetLineWidth(context, 2.0f);
		CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 1.0f);
		for (int i=0; i<_dayArraySize; i++) {
			CGContextMoveToPoint(context, (_width-_width/6)/(_dayArraySize-1)*i, _height-_height/18);
			CGContextAddLineToPoint(context, (_width-_width/6)/(_dayArraySize-1)*i,_height-_height/18-(_height-_height/18-_height+_height/6)*([[_dayArray objectAtIndex:i] floatValue]/maxValue));
		}
		CGContextStrokePath(context);
		
		//折线
		CGContextMoveToPoint(context, 0.0f, _height-_height/6-([[_dayArray objectAtIndex:0] floatValue]-minValue)/(maxValue-minValue)*(_height-_height/6-_height/8));
		for (int i=0; i<_dayArraySize; i++) {
			CGContextAddLineToPoint(context, (_width-_width/6)/(_dayArraySize-1)*i, _height-_height/6-([[_dayArray objectAtIndex:i] floatValue]-minValue)/(maxValue-minValue)*(_height-_height/6-_height/8));
		}
		CGContextSetLineJoin(context, kCGLineJoinRound);
		CGContextStrokePath(context);
		
		//纵向坐标系
		CGContextSetLineWidth(context, 2.0f);
		CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 0.5f);
		CGContextMoveToPoint(context, _width-_width/6, _height-_height/18);
		CGContextAddLineToPoint(context, _width-_width/6, _height/8);
		for (int i=0; i<r; i++) {
			CGContextMoveToPoint(context,_width-_width/6-(_width-_width/6)/(_dayArraySize-1)*5*i, _height-_height/18);
			CGContextAddLineToPoint(context, _width-_width/6-(_width-_width/6)/(_dayArraySize-1)*5*i, _height/8);
		}
		CGContextStrokePath(context);
		
		//纵向数字刻度
		float lengths[]= {1,0};
		CGContextSetLineDash(context, 0, lengths, 2.0f);
		float temp=minValue;
		float dial=(maxValue-minValue)/3;//数字纵向刻度比例
		for (int i=4; i>0; i--) {
			if (i!=1) {
				NSString *str=[NSString stringWithFormat:@"%d",(int)(temp+1.0e-6)];
				[self drawText:context positionWidth:_width-_width/6+5 positionHeight:(_height-_height/6-_height/8)/3.5*i string:[NSString stringWithFormat:@"%f",temp] stringSize:[str length]];
			}else{
				[self drawText:context positionWidth:_width-_width/6+5 positionHeight:(_height-_height/6-_height/8)/4*i string:[NSString stringWithFormat:@"%d",maxValue] stringSize:[[NSString stringWithFormat:@"%d",maxValue] length]];
			}
			temp+=dial;
		}
		//横向日期刻度
		//周一-周五
		NSDate *date=[NSDate date];
		NSInteger i=0;
		while (i<r) {
			_components = [_calendar components:NSWeekdayCalendarUnit fromDate:date];
			NSInteger weekday=[_components weekday];
			if (weekday==7) {
				date=[date dateByAddingTimeInterval:-kINTERVAL];
			}else if(weekday==1){
				date=[date dateByAddingTimeInterval:-kINTERVAL*2];
			}else{
				NSString *temp=[_dateFormatter stringFromDate:date];
				[self drawText:context positionWidth:_width-_width/6-(_width-_width/6)/(_dayArraySize-1)*5*i-8.0f positionHeight:_height-5.0f string:temp stringSize:[temp length]];
				date=[date dateByAddingTimeInterval:-kINTERVAL*7];
				i++;
			}
		}
		//周一-周日
//		NSDate *date=[NSDate date];
//		for (int i=0;i<5; i++) {
//			NSString *temp=[_dateFormatter stringFromDate:date];
//			[self drawText:context positionWidth:width-width/6-(width-width/5)/(dayArraySize-1)*(i+4*i)-8.0f positionHeight:height-5.0f string:temp stringSize:[temp length]];
//			date=[date dateByAddingTimeInterval:-kINTERVAL*7];
//		}
		CGContextStrokePath(context);
	}else{
		//绘制标题
		CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 1.0f);
		CGContextSetLineWidth(context, 1.0f);
		[self drawText:context positionWidth:_width/60 positionHeight:_height/12 string:_title stringSize:[_title length]];
		
		//横向坐标系
		CGContextSetRGBStrokeColor(context, 78.0f/255, 95.0f/255, 131.0f/255, 0.5f);
		CGContextSetLineWidth(context, 2.0f);
		CGContextMoveToPoint(context,1.0f,_height-_height/14);
		CGContextAddLineToPoint(context, _width-1.0f, _height-_height/14);
		CGContextMoveToPoint(context, 1.0f, _height-_height/4);
		CGContextAddLineToPoint(context, _width-1.0f, _height-_height/4);
		CGContextStrokePath(context);
		
		//纵向柱状图
		CGContextSetLineWidth(context, 2.0f);
		CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 1.0f);
		for (int i=0; i<_dayArraySize; i++) {
			CGContextMoveToPoint(context, (_width-_width/8)/(_dayArraySize-1)*i, _height-_height/14);
			CGContextAddLineToPoint(context, (_width-_width/8)/(_dayArraySize-1)*i,_height-_height/14-(_height-_height/14-_height+_height/4)*([[_dayArray objectAtIndex:i] floatValue]/maxValue));
		}
		CGContextStrokePath(context);
		
		//折线
		//(点-min)/(max-min)*(第二条横向纵坐标-纵向坐标系起点纵坐标);
		CGContextMoveToPoint(context, 0.0f, _height-_height/4-([[_dayArray objectAtIndex:0] floatValue]-minValue)/(maxValue-minValue)*(_height-_height/4-_height/8));
		for (int i=0; i<_dayArraySize; i++) {
			CGContextAddLineToPoint(context, (_width-_width/8)/(_dayArraySize-1)*i, _height-_height/4-([[_dayArray objectAtIndex:i] floatValue]-minValue)/(maxValue-minValue)*(_height-_height/4-_height/8));
		}
		CGContextSetLineJoin(context, kCGLineJoinRound);
		CGContextStrokePath(context);
		
		//纵向坐标系
		CGContextSetLineWidth(context, 2.0f);
		CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 0.5f);
		CGContextMoveToPoint(context, _width-_width/8, _height-_height/14);
		CGContextAddLineToPoint(context, _width-_width/8, _height/8);

		for (int i=0; i<r; i++) {
			CGContextMoveToPoint(context, _width-_width/8-(_width-_width/8)/(_dayArraySize-1)*(i+4*i), _height-_height/14);
			CGContextAddLineToPoint(context, _width-_width/8-(_width-_width/8)/(_dayArraySize-1)*(i+4*i), _height/8);
		}
		CGContextStrokePath(context);
		
		//纵向数字刻度
		float lengths[]= {1,0};
		CGContextSetLineDash(context, 0, lengths, 2.0f);
		float temp=minValue;
		float dial=(maxValue-minValue)/5;//数字纵向刻度比例
		for (int i=6; i>0; i--) {
			if (i!=1) {
				NSString *str=[NSString stringWithFormat:@"%d",(int)(temp+1.0e-6)];
				[self drawText:context positionWidth:_width-_width/8+5 positionHeight:(_height-_height/4-_height/8)/5*i string:[NSString stringWithFormat:@"%f",temp] stringSize:[str length]];
			}else{
				[self drawText:context positionWidth:_width-_width/8+5 positionHeight:(_height-_height/4-_height/8)/5*i string:[NSString stringWithFormat:@"%d",maxValue] stringSize:[[NSString stringWithFormat:@"%d",maxValue] length]];
			}
			temp+=dial;
		}
		CGContextStrokePath(context);
		
		//横向日期刻度
		//周一-周五
		NSDate *date=[NSDate date];
		NSInteger i=0;
		while (i<r) {
			_components = [_calendar components:NSWeekdayCalendarUnit fromDate:date];
			NSInteger weekday=[_components weekday];
			if (weekday==7) {
				date=[date dateByAddingTimeInterval:-kINTERVAL];
			}else if(weekday==1){
				date=[date dateByAddingTimeInterval:-kINTERVAL*2];
			}else{
				NSString *temp=[_dateFormatter stringFromDate:date];
				[self drawText:context positionWidth:_width-_width/8-(_width-_width/8)/(_dayArraySize-1)*5*i-8.0f positionHeight:_height-4.0f string:temp stringSize:[temp length]];
				date=[date dateByAddingTimeInterval:-kINTERVAL*7];
				i++;
			}
		}
//		//周一-周日
//		NSDate *date=[NSDate date];
//		for (int i=0; i<5; i++) {
//			NSString *temp=[_dateFormatter stringFromDate:date];
//			[self drawText:context positionWidth:width-width/8-(width-width/8)/dayArraySize*(i+4*i)-8.0f positionHeight:height-4.0f string:temp stringSize:[temp length]];
//			date=[date dateByAddingTimeInterval:-kINTERVAL*7];
//		}
		CGContextStrokePath(context);

		//横向虚线
		CGContextSetLineWidth(context, 2.0f);
		CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 0.3f);
		float lengthsDash[]= {2,2};
		CGContextSetLineDash(context, 0, lengthsDash, 2.0f);
		for (int i=0; i<5; i++) {
			CGContextMoveToPoint(context, 1.0,(_height-_height/4-_height/8)/5*(i+1));
			CGContextAddLineToPoint(context, _width-_width/8,(_height-_height/4-_height/8)/5*(i+1));
		}
		CGContextStrokePath(context);
		
	}
}

-(void)dealloc
{
	Freedoms_Release(_dayArray);
	Freedoms_Release(_calendar);
	[super dealloc];
}

//绘制坐标系文字
-(void)drawText:(CGContextRef)context positionWidth:(CGFloat)width positionHeight:(CGFloat)height string:(NSString *)string stringSize:(NSInteger)stringSize
{
	const char *s=[string UTF8String];
	CGContextSelectFont(context, "Helvetica", 18, kCGEncodingMacRoman);//字体，文字大小，编码
	CGContextSetCharacterSpacing(context, 1);//字间距设置1个文字空间单位
	CGContextSetTextDrawingMode(context, kCGTextFillStroke);//绘制模式：填充+描边
	CGContextSetRGBFillColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 1.0f);
	CGContextSetRGBStrokeColor(context, 255.0f/255, 255.0f/255, 255.0f/255, 1.0f);
	CGAffineTransform transform=CGAffineTransformMake(1.0,0.0,0.0,-1.0,0.0,0.0);
	CGContextSetTextMatrix(context, transform);//设置变换文本矩阵
	CGContextShowTextAtPoint(context, width, height, s, stringSize);//绘制文本，位置，字符数组，字符个数
}

//拖拽坐标
- (void)panGestureRecognizerAction: (UIPanGestureRecognizer *)recognizer
{
	CGPoint point=[recognizer locationInView:self];
	if (point.x/((_width-_width/8)/(_dayArraySize-1))) {
		NSLog(@"Action Pan : %f,%f",point.x,point.y);
	}
}
//滑动
- (void)pinchGestureRecognizerAction:(UIPinchGestureRecognizer *)recognizer
{
	NSLog(@"Action Pinch scale ：%f",recognizer.scale);
}
- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)recognizer
{
	if (recognizer.numberOfTapsRequired==0) {

		CGPoint point=[recognizer locationInView:self];
		NSLog(@"1111 %f,%f",point.x,point.y);
	}else if (recognizer.numberOfTapsRequired==1){
		CGPoint point=[recognizer locationInView:self];
		NSLog(@"2222 %f,%f",point.x,point.y);
	}
}
@end
