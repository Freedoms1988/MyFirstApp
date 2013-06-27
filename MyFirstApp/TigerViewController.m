//
//  TigerViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-21.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "TigerViewController.h"

#define kONECOMPONENT 0
#define kTWOCOMPONENT 1
#define kTHREECOMPONENT 2

#define PICKER_RECT CGRectMake(10.0f,10.0f,300.0f,220.0f)
#define BUTTON_RECT CGRectMake(10.0f,240.0f,300.0f,44.0f)

#define kFONTSIZE 20
#define kRECT CGRectMake(0.0f,0.0f,100.0f,50.0f)
@interface TigerViewController ()
{
	NSArray *_oneArray;
	NSArray *_twoArray;
	NSArray *_threeArray;
	UIPickerView *_picker;
	UIButton *_button;
	NSArray *_array;
	NSInteger newValue;
	NSInteger lastValue;
}

@end

@implementation TigerViewController
#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
	self.title=@"Tiger";
	
	UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemAction)];
	self.navigationItem.rightBarButtonItem = buttonItem;
	Freedoms_Release(buttonItem);
	
	_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	_button.frame = BUTTON_RECT;
 	[_button setTitle:@"Click" forState:UIControlStateNormal];
	[_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_button];
	
	_oneArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0", nil];
	_twoArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0", nil];
	_threeArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0", nil];
	_array = [[NSArray arrayWithObjects:_oneArray,_twoArray,_threeArray,nil] retain];
	
	_picker = [[UIPickerView alloc] initWithFrame:PICKER_RECT];
	_picker.showsSelectionIndicator = YES;
	_picker.delegate=self;
	_picker.dataSource=self;
	for (int i = 0; i < 3; i ++) {
		[_picker selectRow:10000/2-1 inComponent:i animated:YES];
	}
	[self.view addSubview:_picker];
	
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
	Freedoms_Release(_picker);
	Freedoms_Release(_oneArray);
	Freedoms_Release(_twoArray);
	Freedoms_Release(_threeArray);
	Freedoms_Release(_array);
	[super dealloc];
}

#pragma mark - UIAction
-(void)buttonItemAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)buttonAction
{
	NSString *value = @"lose";
	int numInRow=0;
	lastValue = -1;
	for (int i = 0; i < 3; i ++) {
		newValue=random()%[[_array objectAtIndex:i] count];
		if (newValue == lastValue) {
			numInRow ++;
		}else{
			numInRow = 1;
		}
		lastValue=newValue;
//		NSLog(@"%d",newValue);
		[_picker selectRow:newValue inComponent:i animated:YES];
		[_picker reloadComponent:i];
		if (numInRow == 3) {
			value = @"win";
		}
	}
	if ([value isEqualToString:@"win"]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bingo"
														message:@"Congratuations!"
													   delegate:self
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil, nil];
		[alert show];
		Freedoms_Release(alert);
	}
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//	int i;
//	switch (component) {
//		case kONECOMPONENT:
//			i = [_oneArray count];
//			break;
//		case kTWOCOMPONENT:
//			i = [_twoArray count];
//			break;
//		case kTHREECOMPONENT:
//			i = [_threeArray count];
//			break;
//	}
//	return i;
	
	return 10000;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 3;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	switch (component) {
		case kONECOMPONENT:
			return [_oneArray objectAtIndex:row%10];
		case kTWOCOMPONENT:
			return [_twoArray objectAtIndex:row%10];
		case kTHREECOMPONENT:
			return [_threeArray objectAtIndex:row%10];
	}
    return 0;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	NSLog(@"%d",row%10);
}
//与titleForRow：forComponent冲突，优先级与之相比较高
//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//	UILabel *myView = [[[UILabel alloc] initWithFrame:kRECT] autorelease];
//	myView.textAlignment = NSTextAlignmentCenter;
//	myView.font= [UIFont boldSystemFontOfSize:kFONTSIZE];
//	myView.backgroundColor = [UIColor clearColor];
//	myView.text = [_oneArray objectAtIndex:row % [_oneArray count]];
//	return myView;
//}
@end
