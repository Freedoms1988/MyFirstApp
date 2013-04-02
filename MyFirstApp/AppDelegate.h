//
//  AppDelegate.h
//  MyFirstApp
//
//  Created by Freedoms on 13-3-6.
//  Copyright (c) 2013年 Freedoms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "MyNavigationController.h"
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(strong,nonatomic)UIWindow *window;
@property(strong,nonatomic)MyNavigationController *navigationController;
@end
