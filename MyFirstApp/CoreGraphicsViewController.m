//
//  CoreGraphicsViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "CoreGraphicsViewController.h"
#import "MyView.h"

#define MYVIEW_RECT CGRectMake(10.0f,10.0f,300.0f,390.0f)
@interface CoreGraphicsViewController ()
{
	MyView *_myView;
}
@end

@implementation CoreGraphicsViewController

#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
	self.title=@"CoreGraphics";
	
	UIBarButtonItem *buttonItem=[[UIBarButtonItem alloc]initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemAction)];
	self.navigationItem.rightBarButtonItem=buttonItem;
	Freedoms_Release(buttonItem);
	
	_myView=[[MyView alloc]initWithFrame:MYVIEW_RECT];
	[self.view addSubview:_myView];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
	Freedoms_Release(_myView);
	[super dealloc];
}

#pragma mark - UIAction
- (void) buttonItemAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
@end
