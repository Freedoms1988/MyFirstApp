//
//  RegisterViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-11.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "RegisterViewController.h"
#import "MainViewController.h"

#define usernameTFTag 0
#define passwordTFTag 1
#define passwordATFTag 2
#define phoneTFTag 3
#define emailTFTag 4

#define kUserNameLabelRect CGRectMake(10.0f, 10.0f, 80.0f, 44.0f)
#define kOKButtonRect CGRectMake(10.0f, 310.0f, 300.0f, 44.0f)
#define kScrollViewContentSize CGSizeMake(self.view.frame.size.width, 310+44+6+270.0f)
#define kUsernameTFRect CGRectMake(90.0f, 10.0f, 220.0f, 44.0f)
#define kPasswordLabelRect CGRectMake(10.0f, 70.0f,80.0f, 44.0f)
#define kPasswordTFRect CGRectMake(90.0f, 70.0f, 220.0f, 44.0f)
#define kPasswordAffirmLabelRect CGRectMake(10.0f, 130.0f, 80.0f, 44.0f)
#define kPasswordAffirmTFRect CGRectMake(90.0f, 130.0f, 220.0f, 44.0f)
#define kPhoneLabelRect CGRectMake(10.0f, 190.0f, 80.0f, 44.0f)
#define kPhoneTFRect CGRectMake(90.0f, 190.0f, 220.0f, 44.0f)
#define kEmailLabelRect CGRectMake(10.0f, 250.0f, 80.0f, 44.0f)
#define kEmailTFRect CGRectMake(90.0f, 250.0f, 220.0f, 44.0f)

@interface RegisterViewController ()
{
	UIBarButtonItem *_rightItem;
	UITextField *_usernameTextField;
	UITextField *_passwordTextField;
	UITextField *_passwordAffirmTextField;
	UITextField *_phoneTextField;
	UITextField *_emailTextField;
	UIScrollView *_scrollView;
	NSString *_usernameString;
	NSString *_passwordString;
	UITapGestureRecognizer *_tapGestureRecognizer;
}

@end

@implementation RegisterViewController

#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
    self.title=@"Register";
	
	_scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
	_scrollView.pagingEnabled=NO;
	_scrollView.directionalLockEnabled=YES;
	_scrollView.showsHorizontalScrollIndicator=NO;
	_scrollView.showsVerticalScrollIndicator=YES;
	_scrollView.indicatorStyle=UIScrollViewIndicatorStyleDefault;
	_scrollView.delegate=self;
	
	CGSize newSize=kScrollViewContentSize;
	[_scrollView setContentSize:newSize];
	[self.view addSubview:_scrollView];
	
    UILabel *usernameLabel=[[UILabel alloc]initWithFrame:kUserNameLabelRect];
    usernameLabel.text = @"Username";
	[_scrollView addSubview:usernameLabel];
    Freedoms_Release(usernameLabel);
    
    _usernameTextField = [[UITextField alloc] initWithFrame:kUsernameTFRect];
    _usernameTextField.backgroundColor =[ UIColor whiteColor];
    _usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _usernameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _usernameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _usernameTextField.autocapitalizationType = UIViewAutoresizingNone;
    _usernameTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _usernameTextField.returnKeyType = UIReturnKeyNext;
    _usernameTextField.placeholder = @"Please enter username";
	_usernameTextField.delegate = self;
	_usernameTextField.tag = usernameTFTag;
	[_scrollView addSubview:_usernameTextField];
    
    
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:kPasswordLabelRect];
    passwordLabel.text = @"Password";
	//    [self.view addSubview:passwordLabel];
	[_scrollView addSubview:passwordLabel];
    Freedoms_Release(passwordLabel);
    
    _passwordTextField = [[UITextField alloc]initWithFrame:kPasswordTFRect];
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passwordTextField.autocapitalizationType = UIViewAutoresizingNone;
    _passwordTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTextField.returnKeyType = UIReturnKeyNext;
	_passwordTextField.secureTextEntry=YES;
    _passwordTextField.placeholder = @"Please enter password";
	_passwordTextField.delegate = self;
	_passwordTextField.tag = passwordTFTag;
	[_scrollView addSubview:_passwordTextField];
    
    UILabel *passwordAffirmLabel = [[UILabel alloc] initWithFrame:kPasswordAffirmLabelRect];
    passwordAffirmLabel.text = @"Affirm Password";
	[_scrollView addSubview:passwordAffirmLabel];
    Freedoms_Release(passwordAffirmLabel);
    
    _passwordAffirmTextField = [[UITextField alloc] initWithFrame:kPasswordAffirmTFRect];
    _passwordAffirmTextField.backgroundColor = [UIColor whiteColor];
    _passwordAffirmTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordAffirmTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _passwordAffirmTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passwordAffirmTextField.autocapitalizationType = UIViewAutoresizingNone;
    _passwordAffirmTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _passwordAffirmTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordAffirmTextField.returnKeyType = UIReturnKeyNext;
	_passwordTextField.secureTextEntry=YES;
    _passwordAffirmTextField.placeholder = @"Please enter password again";
	_passwordAffirmTextField.delegate = self;
	_passwordAffirmTextField.tag = passwordATFTag;
	[_scrollView addSubview:_passwordAffirmTextField];
    
    UILabel *phoneLabel=[[UILabel alloc] initWithFrame:kPhoneLabelRect];
    phoneLabel.text = @"PhoneNumber";
	[_scrollView addSubview:phoneLabel];
    Freedoms_Release(phoneLabel);
    
    _phoneTextField = [[UITextField alloc] initWithFrame:kPhoneTFRect];
    _phoneTextField.backgroundColor = [UIColor whiteColor];
    _phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    _phoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _phoneTextField.autocapitalizationType = UIViewAutoresizingNone;
    _phoneTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _phoneTextField.keyboardType = UIKeyboardTypePhonePad;//电话键盘
    _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTextField.returnKeyType = UIReturnKeyNext;
    _phoneTextField.placeholder = @"Please enter phoneNumber";
	_phoneTextField.delegate = self;
	_phoneTextField.tag = phoneTFTag;
	[_scrollView addSubview:_phoneTextField];
    
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:kEmailLabelRect];
    emailLabel.text = @"Email";
	[_scrollView addSubview:emailLabel];
    Freedoms_Release(emailLabel);
    
    _emailTextField = [[UITextField alloc] initWithFrame:kEmailTFRect];
    _emailTextField.backgroundColor = [UIColor whiteColor];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _emailTextField.autocapitalizationType = UIViewAutoresizingNone;
    _emailTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
    _emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    _emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _emailTextField.returnKeyType = UIReturnKeyDone;
    _emailTextField.placeholder = @"Please enter email";
	_emailTextField.delegate = self;
	_emailTextField.tag = emailTFTag;
	[_scrollView addSubview:_emailTextField];
    
    UIButton *okButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    okButton.frame = kOKButtonRect;
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(okClickAction) forControlEvents:UIControlEventTouchDown];
	[_scrollView addSubview:okButton];
    Freedoms_Release(okButton);
	
	_rightItem = [[UIBarButtonItem alloc]initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(homeClickAction)];
	self.navigationItem.rightBarButtonItem = _rightItem;
	
	//点击空白处关闭键盘
	_tapGestureRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleBackGroundTap)];
	_tapGestureRecognizer.cancelsTouchesInView=NO;
	[self.view addGestureRecognizer:_tapGestureRecognizer];
	
	[super viewDidLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
	Freedoms_Release(_scrollView);
	Freedoms_Release(_usernameTextField);
	Freedoms_Release(_passwordTextField);
	Freedoms_Release(_passwordAffirmTextField);
	Freedoms_Release(_phoneTextField);
	Freedoms_Release(_emailTextField);
	Freedoms_Release(_rightItem);
	
//	Freedoms_Release(_usernameString);
//	Freedoms_Release(_passwordString);
	
	Freedoms_Release(_tapGestureRecognizer);
	
	[super dealloc];
}
#pragma mark - UIAction
-(void)okClickAction
{
	//若在列表没找到，添加进列表
	//若找到则提示
//	_usernameString = _usernameTextField.text;
//	_passwordString = _passwordTextField.text;
	
//	MainViewController *mainViewController = [[MainViewController alloc]init];
//	if (_usernameString.length==0&&![mainViewController.userDictionary objectForKey:_usernameString]) {
//		[mainViewController.userDictionary setObject:_passwordString forKey:_usernameString];
//		
//	}else{
//		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Already exist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//		[alertView show];
//		[alertView release];
//	}
//	Freedoms_Release(mainViewController);
}
-(void)homeClickAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	switch (textField.tag) {
		case usernameTFTag:
			[_passwordTextField becomeFirstResponder];
			break;
		case passwordTFTag:
			[_passwordAffirmTextField becomeFirstResponder];
			break;
		case passwordATFTag:
			[_phoneTextField becomeFirstResponder];
			break;
		case phoneTFTag:
			[_emailTextField becomeFirstResponder];
			break;
		case emailTFTag:
			[_emailTextField resignFirstResponder];
			[self okClickAction];
			break;
	}
	return YES;
}

-(void)handleBackGroundTap
{
	[_usernameTextField resignFirstResponder];
	[_passwordTextField resignFirstResponder];
	[_passwordAffirmTextField resignFirstResponder];
	[_phoneTextField resignFirstResponder];
	[_emailTextField resignFirstResponder];
}
@end
