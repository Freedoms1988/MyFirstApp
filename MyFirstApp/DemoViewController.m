//
//  DemoViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoView.h"

#define kDEMOVIEW_RECT_PORTAIT CGRectMake(1.0f,1.0f,318.0f,414.0f)

#define kDEMOVIEW_RECT_LANDSCAPE CGRectMake(1.0f,1.0f,478.0f,266.0f)

@interface DemoViewController ()
{
	DemoView *_demoView;
}
@end

@implementation DemoViewController
#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
	self.title=@"Demo";
	self.view.backgroundColor=[UIColor blackColor];
	UIBarButtonItem *buttonItem=[[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemAction)];
	self.navigationItem.rightBarButtonItem=buttonItem;
	Freedoms_Release(buttonItem);
	
	_demoView=[[DemoView alloc]initWithFrame:kDEMOVIEW_RECT_PORTAIT];
	_demoView.backgroundColor=[UIColor clearColor];
	_demoView.dayArray=[NSArray arrayWithObjects:@"220",@"200",@"220",@"290",@"330",@"220",@"220",@"200",@"220",@"290",@"330",@"220",@"290",@"270",@"220",@"220",@"70",@"240",@"240",@"270",@"220",@"270",@"280",@"290",@"270",@"220",@"190",@"70",@"120",nil];
	_demoView.title=@"MOKO";
	[self.view addSubview:_demoView];
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
	Freedoms_Release(_demoView);
	[super dealloc];
}

#pragma mark - UIAction
-(void)buttonItemAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
		_demoView.frame=kDEMOVIEW_RECT_PORTAIT;
	}else{
		_demoView.frame=kDEMOVIEW_RECT_LANDSCAPE;
	}
}
@end
