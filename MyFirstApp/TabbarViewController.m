//
//  SecViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-14.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "TabbarViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"
#define BUTTON_RECT CGRectMake(20.0f,20.0f,80.0f,80.0f)
#define TABBAR_RECT CGRectMake(0.0f,0.0f,self.view.frame.size.width,self.view.frame.size.height)
@interface TabbarViewController ()
{
	UITabBarController *_tabbar;
}
@end

@implementation TabbarViewController

#pragma mark - ViewController Life
- (void)viewDidLoad
{
	self.title=@"Tabbar";
//	UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//	button.frame=BUTTON_RECT;
//	[button setTitle:@"Click" forState:UIControlStateNormal];
//	[button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:button];
	
	UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(homeButtonAction)];
	self.navigationItem.rightBarButtonItem=rightButton;
	[rightButton release];
	
	_tabbar=[[UITabBarController alloc]init];
	_tabbar.delegate=self;
	BlueViewController *blueViewController=[[BlueViewController alloc]init];
	YellowViewController *yellowViewController=[[YellowViewController alloc]init];
	NSArray *array=[NSArray arrayWithObjects:blueViewController,yellowViewController, nil];
	Freedoms_Release(blueViewController);
	Freedoms_Release(yellowViewController);
	_tabbar.viewControllers=array;
	_tabbar.view.frame=TABBAR_RECT;
	[self.view addSubview:_tabbar.view];
    [super viewDidLoad];
}

-(void)dealloc
{
	Freedoms_Release(_tabbar);
	[super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIAction
-(void)homeButtonAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
	viewController.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",80];
}
@end
