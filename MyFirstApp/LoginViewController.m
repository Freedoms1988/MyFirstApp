//
//  LoginViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-6.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "RegisterViewController.h"
#import "UserInfo.h"

#define kUsernameTFTag 0	
#define kPasswordTFTag 1

#define kUSERNAMELABEL_RECT_PORTAIT CGRectMake(10.0f, 10.0f, 60.0f, 44.0f)
#define kUSERNAMETEXTFIELD_RECT_PORIAIT CGRectMake(70.0f, 10.0f, 240.0f, 44.0f)
#define kPASSWORDLABEL_RECT_PORIAIT CGRectMake(10.0f, 70.0f, 60.0f, 44.0f)
#define kPASSWORDTEXTFIELD_RECT_PORIAIT CGRectMake(70.0f, 70.0f, 240.0f, 44.0f)
#define kOKBUTTON_RECT_PORIAIT CGRectMake(10.0f, 135.0f, 140.0f, 44.0f)
#define kCANCELBUTTON_RECT_PORIAIT CGRectMake(170.0f, 135.0f, 140.0f, 44.0f)

#define kUSERNAMELABEL_RECT_LANDSCAPE CGRectMake(35.0f,20.0f,100.0f,44.0f)
#define kUSERNAMETEXTFIELD_RECT_LANDSCAPE CGRectMake(145.0f,20.0f,300.0f,44.0f)
#define kPASSWORDLABEL_RECT_LANDSCAPE CGRectMake(35.0f,85.0f,100.0f,44.0f)
#define kPASSWORDTEXTFIELD_RECT_LANDSCAPE CGRectMake(145.0f,90.0f,300.0f,44.0f)
#define kOKBUTTON_RECT_LANDSCAPE CGRectMake(35.0,180.0f,200.0f,44.0f)
#define kCANCELBUTTON_RECT_LANDSCAPE CGRectMake(240.0f,180.0f,200.0f,44.0f)

@interface LoginViewController (){
	UITextField *_usernameTextField;
    UITextField *_passwordTextField;
	UIBarButtonItem *_rightItem;
	UILabel *_usernameLabel;
	UILabel *_passwordLabel;
	UIButton *_okButton;
	UIButton *_cancelButton;
}
@end

@implementation LoginViewController

#pragma mark - ViewController Life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"LoginView";
    
    _usernameLabel = [[UILabel alloc]initWithFrame:kUSERNAMELABEL_RECT_PORTAIT];
    _usernameLabel.text = @"Username";
    [self.view addSubview:_usernameLabel];
	
    
    _usernameTextField = [[UITextField alloc]initWithFrame:kUSERNAMETEXTFIELD_RECT_PORIAIT];
    _usernameTextField.placeholder = @"Please enter username";
    _usernameTextField.backgroundColor = [UIColor whiteColor];
    _usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _usernameTextField.textColor = [UIColor blackColor];
    _usernameTextField.font = [UIFont fontWithName:@"Arial" size:20.0f];
    _usernameTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _usernameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _usernameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _usernameTextField.autocapitalizationType = UIViewAutoresizingNone;
    _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _usernameTextField.returnKeyType = UIReturnKeyNext;
    _usernameTextField.delegate = self;
    _usernameTextField.tag = kUsernameTFTag;
	_usernameTextField.text=@"root";
    [self.view addSubview:_usernameTextField];
    
    
    _passwordLabel=[[UILabel alloc] initWithFrame:kPASSWORDLABEL_RECT_PORIAIT];
    _passwordLabel.text = @"Password";
    [self.view addSubview:_passwordLabel];
    
    _passwordTextField=[[UITextField alloc]initWithFrame:kPASSWORDTEXTFIELD_RECT_PORIAIT];
    _passwordTextField.placeholder = @"Please enter password";
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.textColor = [UIColor blackColor];
    _passwordTextField.font=[UIFont fontWithName:@"Arial" size:20.0f];
    _passwordTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _passwordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passwordTextField.autocapitalizationType = UIViewAutoresizingNone;
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTextField.returnKeyType = UIReturnKeyDefault;
    _passwordTextField.delegate = self;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.tag = kPasswordTFTag;
	_passwordTextField.text=@"root";
    [self.view addSubview:_passwordTextField];
    
    
    _okButton= [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _okButton.frame = kOKBUTTON_RECT_PORIAIT;
    [_okButton setTitle:@"OK" forState:UIControlStateNormal];
    [_okButton addTarget:self action:@selector(okClickAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_okButton];
	
    
    _cancelButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _cancelButton.frame = kCANCELBUTTON_RECT_PORIAIT;
    [_cancelButton setTitle:@"Register" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(registerClickAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_cancelButton];
	
	
	_rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(homeClickAction)];
    self.navigationItem.rightBarButtonItem = _rightItem;
	[_rightItem release];
}



-(void)dealloc
{
	Freedoms_Release(_usernameLabel);
	Freedoms_Release(_usernameTextField)
	Freedoms_Release(_passwordLabel);
	Freedoms_Release(_passwordTextField);
	Freedoms_Release(_okButton);
	Freedoms_Release(_cancelButton);
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIAction
-(void)okClickAction
{
	NSString *usernameString = _usernameTextField.text;
	NSString *passwordString = _passwordTextField.text;
	NSString *adminUsername = @"root";
	NSString *adminPassword = @"root";
	if ([adminUsername isEqualToString:usernameString]&&[adminPassword isEqualToString:passwordString]) {
		[self.delegate loginUsername:usernameString loginPassword:passwordString];
		[self.navigationController popViewControllerAnimated:YES];
	}else{
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry"
														   message:@"Wrong username or password,please try again!"
														  delegate:self
												 cancelButtonTitle:@"OK"
												 otherButtonTitles:nil, nil];
		[alertView show];
		Freedoms_Release(alertView);
	}
}
-(void)registerClickAction
{
    RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
	MainViewController *mainViewController=[[MainViewController alloc]init];
	registerViewController.delegate=mainViewController;
    [self.navigationController pushViewController:registerViewController animated:YES];
	Freedoms_Release(mainViewController);
    Freedoms_Release(registerViewController);
}

-(void)homeClickAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
//键盘return按钮功能
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch (textField.tag) {
        case kUsernameTFTag:
            [_passwordTextField becomeFirstResponder];
            break;
        case kPasswordTFTag:
            [_passwordTextField resignFirstResponder];
        default:
            break;
    }
    return YES;
}
//禁止屏幕旋转
//-(BOOL)shouldAutorotate
//{
//	return NO;
//}
//-(NSUInteger)supportedInterfaceOrientations
//{
//	return UIInterfaceOrientationMaskPortrait;
//}
//屏幕旋转改变布局
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
		_usernameLabel.frame=kUSERNAMELABEL_RECT_PORTAIT;
		_usernameTextField.frame=kUSERNAMETEXTFIELD_RECT_PORIAIT;
		_passwordLabel.frame=kPASSWORDLABEL_RECT_PORIAIT;
		_passwordTextField.frame=kPASSWORDTEXTFIELD_RECT_PORIAIT;
		_okButton.frame=kOKBUTTON_RECT_PORIAIT;
		_cancelButton.frame=kCANCELBUTTON_RECT_PORIAIT;
	}else{
		_usernameLabel.frame=kUSERNAMELABEL_RECT_LANDSCAPE;
		_usernameTextField.frame=kUSERNAMETEXTFIELD_RECT_LANDSCAPE;
		_passwordLabel.frame=kPASSWORDLABEL_RECT_LANDSCAPE;
		_passwordTextField.frame=kPASSWORDTEXTFIELD_RECT_LANDSCAPE;
		_okButton.frame=kOKBUTTON_RECT_LANDSCAPE;
		_cancelButton.frame=kCANCELBUTTON_RECT_LANDSCAPE;
	}
}
@end
