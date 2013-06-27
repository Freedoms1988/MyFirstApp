//
//  Weatherinfo.h
//  MyFirstApp
//
//  Created by Freedoms on 13-6-26.
//  Copyright (c) 2013年 Freedoms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject
@property (nonatomic,assign) NSString *city;
@property (nonatomic,assign) NSString *cityid;
@property (nonatomic,assign) NSString *temp;
@property (nonatomic,assign) NSString *WD;
@property (nonatomic,assign) NSString *WS;
@property (nonatomic,assign) NSString *SD;
@property (nonatomic,assign) NSString *WSE;
@property (nonatomic,assign) NSString *time;
@property (nonatomic,assign) NSString *isRadar;
@property (nonatomic,assign) NSString *Radar;
@end
