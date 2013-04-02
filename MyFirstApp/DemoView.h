//
//  DemoView.h
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoView : UIView<UIGestureRecognizerDelegate>
//数据数组
@property(strong,nonatomic) NSMutableArray *dayArray;//数据数组
@property(strong,nonatomic) NSString *title;//标题
//写字
-(void)drawText:(CGContextRef)context positionWidth:(CGFloat)width positionHeight:(CGFloat)height string:(NSString *)string stringSize:(NSInteger)stringSize;
//拖拽坐标
- (void)panGestureRecognizerAction: (UIPanGestureRecognizer *)recognizer;
@end
