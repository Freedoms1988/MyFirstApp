//
//  PickerViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-19.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "PickerViewController.h"
#define kParentComponent 0
#define kChildComponent 1

#define PICKER_RECT CGRectMake(0.0f,0.0f,320.0f,216.0f)
#define MYVIEW_RECT CGRectMake(0.0f,220.0f,320.0f,200.0f)

@interface PickerViewController ()
{
	UIPickerView *_twoPicker;
	NSArray *_twoParentArray;
	NSMutableArray *_twoChildArray;
	NSDictionary *_twoDictionary;
	NSInteger _twoParentPosition;
	NSInteger _twoChildPosition;
}
@end

@implementation PickerViewController

#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
	self.title=@"PickerView";
	
	//读取plist路径
	NSString *plistString=[[NSBundle mainBundle] pathForResource:@"array" ofType:@"plist"];
	//读取plist
	_twoDictionary=[[NSDictionary alloc] initWithContentsOfFile:plistString];
	//获取数据字典所有key,赋值给左边滚轮数据源
	_twoParentArray=[[_twoDictionary allKeys]retain];
	//初始化右边滚轮数据源
	_twoChildArray=[_twoDictionary objectForKey:[_twoParentArray objectAtIndex:0]];
	//初始化选择器
	_twoPicker=[[UIPickerView alloc]initWithFrame:PICKER_RECT];
	_twoPicker.delegate=self;
	_twoPicker.dataSource=self;
	//显示选择框
	_twoPicker.showsSelectionIndicator=YES;
	[self.view addSubview:_twoPicker];
	
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
	Freedoms_Release(_twoPicker);
	Freedoms_Release(_twoParentArray);
	Freedoms_Release(_twoDictionary);
	[super dealloc];
}
#pragma mark - UIAction
//返回滚轮数据源数据条数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	int i;
	switch (component) {//判断左右两边滚轮
		case kParentComponent://若左边滚轮，则返回左边滚轮数据源条数
			i=[_twoParentArray count];
			break;
		case kChildComponent://若右边滚轮，则返回右边滚轮数据源条数
			i=[_twoChildArray count];
			break;
	}
	return i;
}
//返回选择器有多少个滚轮
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}
//转动到哪一行的哪一列
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//	NSLog(@"%d",row);
//	NSLog(@"%d",component);
	switch (component) {//判断左右滚轮
		case kParentComponent://若左边滚轮，以左边被选定数据为key，从数据字典中获取右边数据集合
			_twoChildArray=[_twoDictionary objectForKey:[_twoParentArray objectAtIndex:row]];
//			NSLog(@"%@",_twoChildArray);
			//强制右边滚轮选定第0条
			[pickerView selectRow:0 inComponent:kChildComponent animated:YES];
			
			[pickerView reloadComponent:kChildComponent];
			break;
		case kChildComponent:
			_twoChildPosition=row;
//			NSLog(@"%@",[_twoChildArray objectAtIndex:row]);
			break;
		default:
			break;
	}
}
//返回组件高度，若未实现，选取器自动调整到合适高度
//-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//
//}
//每列每行的具体内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSString *str;
	switch (component) {
		case kParentComponent:
			str=[_twoParentArray objectAtIndex:row];
			break;
		case kChildComponent:
			str=[_twoChildArray objectAtIndex:row];
			break;
	}
	return str;
}
@end
