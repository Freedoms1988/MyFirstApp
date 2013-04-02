//
//  CommonHeader.h
//  MyFirstApp
//
//  Created by Freedoms on 13-3-11.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//
#ifndef MyFirstApp_CommonHeader_h
#define MyFirstApp_CommonHeader_h
//obj=nil，将即将销毁的对象的指针转向到空地址，以防止销毁后再次调用，可能出现空指针问题
//
#define Freedoms_Release(obj) [obj release];obj=nil;
#define Freedoms_Log(str) NSLog(@"%@",str);

#endif
