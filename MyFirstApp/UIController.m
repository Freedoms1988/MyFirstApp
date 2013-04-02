//
//  OneViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-14.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "UIController.h"

#define BUTTON_RECT CGRectMake(10.0f,10.0f,300.0f,44.0f)
#define SLIDER_RECT CGRectMake(60.0f,50.0f,250.0f,44.0f)
#define SLIDER_LABEL_RECT CGRectMake(10.0f,50.0f,50.0f,44.0f)
#define SWITCH_LEFT_RECT CGRectMake(10.0f,100.0f,0.0f,0.0f)
#define SCROLLERVIEW_RECT CGRectMake(0.0f,0.0f,320.0f,960.f)
#define SEGMENTEDCONTROL_RECT CGRectMake(10.0f,140.f,300.0f,44.0f)
#define TOOLBAR_RECT CGRectMake(0.0f,372.0f,320.0f,44.0f)
#define PROGRASSBAR_RECT CGRectMake(0.0f,0.0f,220.0f,44.0f)
#define ITEMBUTTON_RECT CGRectMake(0.0f,0.0f,50.0f,44.0f)

@interface UIController ()
{
	UILabel *_label;
	UISlider *_slider;
	UISwitch *_switch;
	UIScrollView *_scrollView;
	UIActionSheet *_actionSheet;
	UISegmentedControl *_segmentedControl;
	UIToolbar *_toolbar;
	UIProgressView *_progress;
	NSTimer *_timer;
}
@end

@implementation UIController

#pragma mark - ViewController Life
- (void)viewDidLoad
{
	self.title=@"UIController";
	
	_scrollView=[[UIScrollView alloc]initWithFrame:SCROLLERVIEW_RECT];
	[self.view addSubview:_scrollView];
	
	_label=[[UILabel alloc]initWithFrame:SLIDER_LABEL_RECT];
	_label.text=@"50";
	[_scrollView addSubview:_label];
	
	UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame=BUTTON_RECT;
	[button setTitle:@"UIButton" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchUpInside];
	[_scrollView addSubview:button];
	
	_slider=[[UISlider alloc]initWithFrame:SLIDER_RECT];
	_slider.minimumValue=0;
	_slider.maximumValue=100;
	_slider.value=50;
	_slider.continuous=YES;
	[_slider addTarget:self action:@selector(sliderUpdateAction) forControlEvents:UIControlEventValueChanged];
	[_scrollView addSubview:_slider];
	
	_switch=[[UISwitch alloc]initWithFrame:SWITCH_LEFT_RECT];
	[_switch setOn:NO];
	[_switch addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventValueChanged];
	[_scrollView addSubview:_switch];
	
	_actionSheet=[[UIActionSheet alloc]initWithTitle:@"ActionSheet"
											delegate:self cancelButtonTitle:@"Cancel"
							  destructiveButtonTitle:@"OK"
								   otherButtonTitles:@"One",@"Two",@"Three", nil];
	
	_segmentedControl=[[UISegmentedControl alloc]initWithFrame:SEGMENTEDCONTROL_RECT];
	_segmentedControl.segmentedControlStyle=UISegmentedControlStyleBar;
	[_segmentedControl insertSegmentWithTitle:@"000" atIndex:0 animated:YES];
	[_segmentedControl insertSegmentWithTitle:@"111" atIndex:1 animated:YES];
	[_segmentedControl insertSegmentWithTitle:@"222" atIndex:2 animated:YES];
	[_segmentedControl addTarget:self action:@selector(segmentedControlAction) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:_segmentedControl];
	
	_toolbar=[[UIToolbar alloc]initWithFrame:TOOLBAR_RECT];
	NSMutableArray *array=[[NSMutableArray array]retain];
	UIButton *itemButton=[[UIButton alloc]initWithFrame:ITEMBUTTON_RECT];
	[itemButton setTitle:@"Click" forState:UIControlStateNormal];
	[itemButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithCustomView:itemButton];
	_progress=[[UIProgressView alloc]initWithFrame:PROGRASSBAR_RECT];
	_progress.progress=0.0;
	UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithCustomView:_progress];
	[array addObject:item1];
	[array addObject:item2];
	[_toolbar setItems:array animated:YES];
	[self.view addSubview:_toolbar];
	Freedoms_Release(item1);
	Freedoms_Release(item2);
	Freedoms_Release(array);
	Freedoms_Release(_toolbar);
	
	UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(homeButtonAction)];
	self.navigationItem.rightBarButtonItem=rightButton;
	Freedoms_Release(rightButton);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
	Freedoms_Release(_scrollView);
	Freedoms_Release(_label);
	Freedoms_Release(_slider);
	Freedoms_Release(_switch);
	Freedoms_Release(_actionSheet);
	Freedoms_Release(_segmentedControl);
	Freedoms_Release(_progress);
	Freedoms_Release(_timer);
	[_timer invalidate];
	NSLog(@"销毁");
	[super dealloc];
}

#pragma mark - UIActions
-(void)buttonClickAction
{
	//	[self.navigationController popToRootViewControllerAnimated:YES];
	[_actionSheet showInView:self.view];
}
-(void)sliderUpdateAction
{
	_label.text=[NSString stringWithFormat:@"%f",_slider.value];
}
-(void)switchAction
{
	BOOL setting=[_switch isOn];
	if (setting) {
		_label.text=@"开启";
	}else{
		_label.text=@"关闭";
	}
	[_switch setOn:setting animated:YES];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex) {
		case 0:
			_label.text=@"ok";
			break;
		case 1:
			_label.text=@"One";
			break;
		case 2:
			_label.text=@"Two";
			break;
		case 3:
			_label.text=@"Three";
			break;
		case 4:
			_label.text=@"Cancel";
			break;
		default:
			break;
	}
}
-(void)segmentedControlAction
{
	_label.text=[NSString stringWithFormat:@"%d",[_segmentedControl selectedSegmentIndex]];
}
-(void)buttonAction
{
	_timer=[[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateAction) userInfo:nil repeats:YES]retain];
	[_timer fire];
}
-(void)updateAction
{
	_progress.progress=_progress.progress+0.1;
	if (_progress.progress==1.0) {
		UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Bingo" message:@"Success!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
		[alert show];
		Freedoms_Release(alert);
		[_timer invalidate];
	}
}
-(void)alertViewCancel:(UIAlertView *)alertView
{
	
}
//弹出框消失时，初始化进度条
//-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//	_progress.progress=0.0;
//}

-(void)homeButtonAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex==0) {
		_progress.progress=0.0;
	}
}
@end
