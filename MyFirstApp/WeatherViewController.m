//
//  WeatherViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-6-28.
//  Copyright (c) 2013年 Freedoms. All rights reserved.
//

#import "WeatherViewController.h"
#define CGRECT_CITYPICKER CGRectMake()
#define CGRECT_MODESEGMENT CGRectMake(5.0f,5.0f,310.0f,30.0f)
#define CGRECT_SENDBUTTON CGRectMake()
#define CGRECT_NOWTEMPTEXT CGRectMake()
#define CGRECT_NOWWEATHERIMG CGRectMake()
#define CGRECT_NOWPTIMETEXT CGRectMake()
#define CGRECT_NOWHUMTEXT CGRectMake()
#define CGRECT_DATETEXT CGRectMake()
#define CGRECT_NOWWINDSCALETEXT CGRectMake()
#define CGRECT_TEMPTEXT CGRectMake()

#define CGRECT_PROVINCE_URL @"http://m.weather.com.cn/data5/city.xml"

@interface WeatherViewController ()
{
    /*
    首页
     */
    UIBarButtonItem *_homeButton;
    /*
     模式选择
     */
    UISegmentedControl *_modeSegmentedControl;
    /*
     地区选择器
     */
    UIPickerView *_cityPicker;
    /*
     发送请求按钮
     */
    UIButton *_sendButton;
    /*
     当前温度
     */
    UITextView *_nowTempText;
    /*
     预报温度范围
     */
    UITextView *_tempText;
    /*
     当前天气图标
     */
    UIImageView *_nowWeatherImage;
    /*
     发布时间
     */
    UITextView *_nowPTimeText;
    /*
     风级
     */
    UITextView *_windScaleText;
    /*
     日期
     */
    UITextView *_dateText;
    /*
     湿度
     */
    UITextView *_humText;
}
@end

@implementation WeatherViewController
#pragma mark - ViewController Circle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self initData];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    Freedoms_Release(_homeButton);
    Freedoms_Release(_modeSegmentedControl);
    Freedoms_Release(_cityPicker);
    Freedoms_Release(_sendButton);
    Freedoms_Release(_nowPTimeText);
    Freedoms_Release(_tempText);
    Freedoms_Release(_nowTempText);
    Freedoms_Release(_nowWeatherImage);
    Freedoms_Release(_windScaleText);
    Freedoms_Release(_dateText);
    Freedoms_Release(_humText);
    [super dealloc];
}

#pragma mark - init
-(void) initUI
{
    self.title = @"Weather";
    
    _homeButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(homeAction)];
    self.navigationItem.rightBarButtonItem = _homeButton;
    
    _modeSegmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRECT_MODESEGMENT];
    [_modeSegmentedControl insertSegmentWithTitle:@"实时天气" atIndex:0 animated:YES];
    [_modeSegmentedControl insertSegmentWithTitle:@"7日天气" atIndex:1 animated:YES];
    [_modeSegmentedControl insertSegmentWithTitle:@"今天天气" atIndex:2 animated:YES];
    _modeSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [_modeSegmentedControl addTarget:self action:@selector(modeSegmentedControlAction) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_modeSegmentedControl];
    
    
}

-(void) initData
{
//    NSURL *url = [NSURL URLWithString:<#(NSString *)#>]
//    AFHTTPRequestOperation *httpRequestOperation = [AFHTTPRequestOperation alloc] initWithRequest:<#(NSURLRequest *)#>
}
#pragma mark - UI Action
-(void) homeAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
