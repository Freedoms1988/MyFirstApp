//
//  GestureRecognizerViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-22.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "GestureRecognizerViewController.h"

@interface GestureRecognizerViewController ()

@end

@implementation GestureRecognizerViewController

#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
	self.title=@"GestureRecongizer";
	
	UIBarButtonItem *buttonItem=[[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemAction)];
	self.navigationItem.rightBarButtonItem=buttonItem;
	Freedoms_Release(buttonItem);
	
	//点击手势监听
//	UITapGestureRecognizer *oneGestureRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapGestureRecognizerAction)] autorelease];
//	[oneGestureRecognizer setNumberOfTapsRequired:1];//几次点击
//	[oneGestureRecognizer setNumberOfTouchesRequired:1];//几根手指
//	[self.view addGestureRecognizer:oneGestureRecognizer];
//	
//	UITapGestureRecognizer *twoGestureRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoTapGestureRecognizerAction)] autorelease];
//	[twoGestureRecognizer setNumberOfTapsRequired:2];
//	[twoGestureRecognizer setNumberOfTouchesRequired:1];
//	[self.view addGestureRecognizer:twoGestureRecognizer];
//	//若检测双击手势失败，检测单击手势
//	[oneGestureRecognizer requireGestureRecognizerToFail:twoGestureRecognizer];
	
//	//缩放手势监听
//	UIPinchGestureRecognizer *pinchGestureRecognizer = [[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizerAction:)] autorelease];
//	[self.view addGestureRecognizer:pinchGestureRecognizer];
//
//	//旋转手势监听
//	UIRotationGestureRecognizer *rotationGestureRecognizer = [[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureRecognizerAction:)] autorelease];
//	[self.view addGestureRecognizer:rotationGestureRecognizer];
//	
//	//滑动手势监听(取的是起点)
//	UISwipeGestureRecognizer *swipeGestureRecognizer = [[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGestureRecognizer:)] autorelease];
//	[swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
//	[self.view addGestureRecognizer:swipeGestureRecognizer];
//
//	//拖拽手势监听（取的是过程）
	UIPanGestureRecognizer *panGestureRecognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)] autorelease];
	[panGestureRecognizer setMaximumNumberOfTouches:1];//最多几根手指动作
	[self.view addGestureRecognizer:panGestureRecognizer];
//
//	//长按手势监听()
//	UILongPressGestureRecognizer *longPressGestureRecognizer = [[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognizerAction)] autorelease];
//	[self.view addGestureRecognizer:longPressGestureRecognizer];
	
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - UIAction
- (void)buttonItemAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - GestureRecongizerAction
- (void)oneTapGestureRecognizerAction
{
	NSLog(@"Action one finger one taps");
}

- (void)twoTapGestureRecognizerAction
{
	NSLog(@"Action one finger two taps");
}

- (void)pinchGestureRecognizerAction:(UIPinchGestureRecognizer *)recognizer
{
	NSLog(@"Action Pinch scale ：%f",recognizer.scale);
}

- (void)rotationGestureRecognizerAction:(UIRotationGestureRecognizer *)recognizer
{
	NSLog(@"Action Rotation in degress since last change: %f",[recognizer rotation]*(180/M_PI));
}

- (void)swipeGestureRecognizer:(UISwipeGestureRecognizer *)recognizer
{
	CGPoint point=[recognizer locationInView:self.view];
	NSLog(@"Action Swipe up - start location : %f,%f",point.x,point.y);
}

- (void)panGestureRecognizerAction: (UIPanGestureRecognizer *)recognizer
{
	CGPoint point=[recognizer locationInView:self.view];
	NSLog(@"Action Pan : %f,%f",point.x,point.y);
}

- (void)longPressGestureRecognizerAction
{
	NSLog(@"Action Long Pressed");
}

@end
