//
//  LoginViewController.h
//  MyFirstApp
//
//  Created by Freedoms on 13-3-6.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;

@protocol LoginViewDelegate <NSObject>

-(void)loginUsername:(NSString *)username loginPassword:(NSString *)password;

@end

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,assign)id<LoginViewDelegate> delegate;

@end
