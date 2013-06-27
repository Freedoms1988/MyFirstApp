//
//  RegisterViewController.h
//  MyFirstApp
//
//  Created by Freedoms on 13-3-11.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RegisterViewController;
@protocol RegisterViewDelegate <NSObject>

-(void)registUsername:(NSString *)usernameString registPassword:(NSString *)passwordString;

@end
@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
@property(nonatomic,assign)id<RegisterViewDelegate> delegate;
@end
