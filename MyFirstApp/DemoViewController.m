//
//  DemoViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "DemoViewController.h"
#import "ChartView.h"
#import "BoardView.h"
//图表
#define kDEMOVIEW_RECT_PORTAIT CGRectMake(1.0f,1.0f,318.0f,414.0f)
#define kDEMOVIEW_RECT_LANDSCAPE CGRectMake(1.0f,1.0f,478.0f,266.0f)
//图表结束
//棋盘
#define kBoardView_RECT CGRectMake(0.0f,0.0f,320.0f,480.0f-20.0f-44.0f)
//棋盘结束

@interface DemoViewController ()
{
	//图表
	ChartView *_chartView;
	//图表结束
	//棋盘
//	BoardView *_boardView;
	//棋盘结束
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
	//图表
	_chartView=[[ChartView alloc]initWithFrame:kDEMOVIEW_RECT_PORTAIT];
	_chartView.backgroundColor=[UIColor clearColor];
	_chartView.dayArray=[NSArray arrayWithObjects:@"220",@"200",@"220",@"290",@"330",@"220",@"220",@"200",@"220",@"290",@"330",@"220",@"290",@"270",@"220",@"220",@"70",@"240",@"240",@"270",@"220",@"270",@"280",@"290",@"270",@"220",@"190",@"70",@"120",nil];
	_chartView.title=@"MOKO";
	[self.view addSubview:_chartView];
	//图表结束
	//棋盘
//	_boardView = [[BoardView alloc] initWithFrame:kBoardView_RECT];
//	_boardView.backgroundColor = [UIColor clearColor];
//	[self.view addSubview:_boardView];
	//棋盘结束
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
	//图表
	Freedoms_Release(_chartView);
	//图表结束
	//棋盘
//	Freedoms_Release(_boardView);
	//棋盘结束
	[super dealloc];
}

#pragma mark - UIAction
-(void)buttonItemAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
//图表
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
		_chartView.frame=kDEMOVIEW_RECT_PORTAIT;
	}else{
		_chartView.frame=kDEMOVIEW_RECT_LANDSCAPE;
	}
}
//图表结束
@end
