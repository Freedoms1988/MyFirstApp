//
//  CAView.m
//  MyFirstApp
//
//  Created by Freedoms on 13-5-8.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "CAView.h"


@interface CAView()
{
    CAEmitterLayer *emitterLayer;
}
@end

@implementation CAView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        emitterLayer = (CAEmitterLayer *)self.layer;//设置rootLayer
        emitterLayer.emitterPosition = CGPointMake(frame.size.width/2, frame.size.height/2);//坐标
        emitterLayer.emitterSize=CGSizeMake(2.0f, 2.0f);//粒子大小
        emitterLayer.renderMode=kCAEmitterLayerCircle;//粒子渲染效果
        
        CAEmitterCell *fire=[CAEmitterCell emitterCell];
        fire.birthRate = 10.0f;//生成速率
        fire.lifetime = 10.0f;//持续时间
        fire.lifetimeRange = 0.5f;//持续时间变化范围
        fire.color = [[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1] CGColor];//颜色
        fire.contents = (id)[[UIImage imageNamed:@"dr.png"] CGImage];//内容
        [fire setName:@"fire"];//粒子名称
        
        fire.velocity = 100.0f;//每秒移动像素数
        fire.velocityRange = 100.0f;//每秒移动像素数变化范围
        fire.emissionRange = 2*M_PI;//发射角度
        fire.scaleSpeed = 0.0f;//变大速率
        fire.spin = 1.0f;//旋转速率

        
        //add the cell to the layer and we're done
        emitterLayer.emitterCells = [NSArray arrayWithObject:fire];
    }
    return self;
}

+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
@end
