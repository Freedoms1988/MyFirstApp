//
//  ViewController.h
//  MyFirstApp
//
//  Created by Freedoms on 13-3-6.
//  Copyright (c) 2013年 Freedoms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "UIController.h"
#import "TabbarViewController.h"
#import "UserInfo.h"
#import "RegisterViewController.h"

@interface MainViewController : UIViewController<LoginViewDelegate,UITableViewDataSource,UITableViewDelegate,RegisterViewDelegate>
@property(strong,nonatomic)UserInfo *userInfo;
@property(strong,nonatomic)NSMutableDictionary *userDictionary;
@end