//
//  AFNetWorkingViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-6-26.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "AFNetWorkingViewController.h"

#define CGRECT_TEXTFIELD CGRectMake(10.0f,5.0f,300.0f,44.0f)
#define CGRECT_NOW_BUTTON CGRectMake(5.0f,55.0f,100.0f,44.0f)
#define CGRECT_SEVEN_BUTTON CGRectMake(110.0f,55.0f,100.0f,44.0f)
#define CGRECT_TODAY_BUTTON CGRectMake(215.0f,55.0f,100.0f,44.0f)
#define CGRECT_TABLEVIEW CGRectMake(0.0f, 100.0f, 320.0f, 460.0f)

//#define URL @"http://www.weather.com.cn/data/sk/101010100.html"
//实时天气预报接口
#define NOW @"http://www.weather.com.cn/data/sk/"
//7天天气预报接口
#define SEVEN @"http://m.weather.com.cn/data/"
//当天天气预报接口
#define TODAY @"http://www.weather.com.cn/data/cityinfo/"
#define CITY @"北京:101010100朝阳:101010300顺义:101010400怀柔:101010500通州:101010600昌平:101010700延庆:101010800丰台:101010900石景山:101011000大兴:101011100房山:101011200密云:101011300门头沟:101011400平谷:101011500八达岭:101011600佛爷顶:101011700汤河口:101011800密云上甸子:101011900斋堂:101012000霞云岭:101012100北京城区:101012200海淀:101010200天津:101030100宝坻:101030300东丽:101030400西青:101030500北辰:101030600蓟县:101031400汉沽:101030800静海:101030900津南:101031000塘沽:101031100大港:101031200武清:101030200宁河:101030700上海:101020100宝山:101020300嘉定:101020500南汇:101020600浦东:101021300青浦:101020800松江:101020900奉贤:101021000崇明:101021100徐家汇:101021200闵行:101020200金山:101020700石家庄:101090101张家口:101090301承德:101090402唐山:101090501秦皇岛:101091101沧州:101090701衡水:101090801邢台:101090901邯郸:101091001保定:101090201廊坊:101090601郑州:101180101新乡:101180301许昌:101180401平顶山:101180501信阳:101180601南阳:101180701开封:101180801洛阳:101180901商丘:101181001焦作:101181101鹤壁:101181201濮阳:101181301周口:101181401漯河:101181501驻马店:101181601三门峡:101181701济源:101181801安阳:101180201合肥:101220101芜湖:101220301淮南:101220401马鞍山:101220501安庆:101220601宿州:101220701阜阳:101220801亳州:101220901黄山:101221001滁州:101221101淮北:101221201铜陵:101221301宣城:101221401六安:101221501巢湖:101221601池州:101221701蚌埠:101220201杭州:101210101舟山:101211101湖州:101210201嘉兴:101210301金华:101210901绍兴:101210501台州:101210601温州:101210701丽水:101210801衢州:101211001宁波:101210401重庆:101040100合川:101040300南川:101040400江津:101040500万盛:101040600渝北:101040700北碚:101040800巴南:101040900长寿:101041000黔江:101041100万州天城:101041200万州龙宝:101041300涪陵:101041400开县:101041500城口:101041600云阳:101041700巫溪:101041800奉节:101041900巫山:101042000潼南:101042100垫江:101042200梁平:101042300忠县:101042400石柱:101042500大足:101042600荣昌:101042700铜梁:101042800璧山:101042900丰都:101043000武隆:101043100彭水:101043200綦江:101043300酉阳:101043400秀山:101043600沙坪坝:101043700永川:101040200福州:101230101泉州:101230501漳州:101230601龙岩:101230701晋江:101230509南平:101230901厦门:101230201宁德:101230301莆田:101230401三明:101230801兰州:101160101平凉:101160301庆阳:101160401武威:101160501金昌:101160601嘉峪关:101161401酒泉:101160801天水:101160901武都:101161001临夏:101161101合作:101161201白银:101161301定西:101160201张掖:101160701广州:101280101惠州:101280301梅州:101280401汕头:101280501深圳:101280601珠海:101280701佛山:101280800肇庆:101280901湛江:101281001江门:101281101河源:101281201清远:101281301云浮:101281401潮州:101281501东莞:101281601中山:101281701阳江:101281801揭阳:101281901茂名:101282001汕尾:101282101韶关:101280201南宁:101300101柳州:101300301来宾:101300401桂林:101300501梧州:101300601防城港:101301401贵港:101300801玉林:101300901百色:101301001钦州:101301101河池:101301201北海:101301301崇左:101300201贺州:101300701贵阳:101260101安顺:101260301都匀:101260401兴义:101260906铜仁:101260601毕节:101260701六盘水:101260801遵义:101260201凯里:101260501昆明:101290101红河:101290301文山:101290601玉溪:101290701楚雄:101290801普洱:101290901昭通:101291001临沧:101291101怒江:101291201香格里拉:101291301丽江:101291401德宏:101291501景洪:101291601大理:101290201曲靖:101290401保山:101290501呼和浩特:101080101乌海:101080301集宁:101080401通辽:101080501阿拉善左旗:101081201鄂尔多斯:101080701临河:101080801锡林浩特:101080901呼伦贝尔:101081000乌兰浩特:101081101包头:101080201赤峰:101080601南昌:101240101上饶:101240301抚州:101240401宜春:101240501鹰潭:101241101赣州:101240701景德镇:101240801萍乡:101240901新余:101241001九江:101240201吉安:101240601武汉:101200101黄冈:101200501荆州:101200801宜昌:101200901恩施:101201001十堰:101201101神农架:101201201随州:101201301荆门:101201401天门:101201501仙桃:101201601潜江:101201701襄樊:101200201鄂州:101200301孝感:101200401黄石:101200601咸宁:101200701成都:101270101自贡:101270301绵阳:101270401南充:101270501达州:101270601遂宁:101270701广安:101270801巴中:101270901泸州:101271001宜宾:101271101内江:101271201资阳:101271301乐山:101271401眉山:101271501凉山:101271601雅安:101271701甘孜:101271801阿坝:101271901德阳:101272001广元:101272101攀枝花:101270201银川:101170101中卫:101170501固原:101170401石嘴山:101170201吴忠:101170301西宁:101150101黄南:101150301海北:101150801果洛:101150501玉树:101150601海西:101150701海东:101150201海南:101150401济南:101120101潍坊:101120601临沂:101120901菏泽:101121001滨州:101121101东营:101121201威海:101121301枣庄:101121401日照:101121501莱芜:101121601聊城:101121701青岛:101120201淄博:101120301德州:101120401烟台:101120501济宁:101120701泰安:101120801西安:101110101延安:101110300榆林:101110401铜川:101111001商洛:101110601安康:101110701汉中:101110801宝鸡:101110901咸阳:101110200渭南:101110501太原:101100101临汾:101100701运城:101100801朔州:101100901忻州:101101001长治:101100501大同:101100201阳泉:101100301晋中:101100401晋城:101100601吕梁:101101100乌鲁木齐:101130101石河子:101130301昌吉:101130401吐鲁番:101130501库尔勒:101130601阿拉尔:101130701阿克苏:101130801喀什:101130901伊宁:101131001塔城:101131101哈密:101131201和田:101131301阿勒泰:101131401阿图什:101131501博乐:101131601克拉玛依:101130201拉萨:101140101山南:101140301阿里:101140701昌都:101140501那曲:101140601日喀则:101140201林芝:101140401台北县:101340101高雄:101340201台中:101340401海口:101310101三亚:101310201东方:101310202临高:101310203澄迈:101310204儋州:101310205昌江:101310206白沙:101310207琼中:101310208定安:101310209屯昌:101310210琼海:101310211文昌:101310212保亭:101310214万宁:101310215陵水:101310216西沙:101310217南沙岛:101310220乐东:101310221五指山:101310222琼山:101310102长沙:101250101株洲:101250301衡阳:101250401郴州:101250501常德:101250601益阳:101250700娄底:101250801邵阳:101250901岳阳:101251001张家界:101251101怀化:101251201黔阳:101251301永州:101251401吉首:101251501湘潭:101250201南京:101190101镇江:101190301苏州:101190401南通:101190501扬州:101190601宿迁:101191301徐州:101190801淮安:101190901连云港:101191001常州:101191101泰州:101191201无锡:101190201盐城:101190701哈尔滨:101050101牡丹江:101050301佳木斯:101050401绥化:101050501黑河:101050601双鸭山:101051301伊春:101050801大庆:101050901七台河:101051002鸡西:101051101鹤岗:101051201齐齐哈尔:101050201大兴安岭:101050701长春:101060101延吉:101060301四平:101060401白山:101060901白城:101060601辽源:101060701松原:101060801吉林:101060201通化:101060501沈阳:101070101鞍山:101070301抚顺:101070401本溪:101070501丹东:101070601葫芦岛:101071401营口:101070801阜新:101070901辽阳:101071001铁岭:101071101朝阳:101071201盘锦:101071301大连:101070201锦州:101070701"
@interface AFNetWorkingViewController ()
{
    UIButton *_sendNowButton;
    UIButton *_sendSevenButton;
    UIButton *_sendTodayButton;
    UITextField *_cityTextfield;
    UIBarButtonItem *_homeButton;
    UITableView *_tableView;
    
    NSDictionary *_weatherDict;
    NSArray *_weatherInfoKeys;
    NSMutableDictionary *_weatherKeysDict;
    NSMutableArray *_weatherArray;
    NSMutableDictionary *_citysDict;
}
@end

@implementation AFNetWorkingViewController
#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUIView];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    Freedoms_Release(_sendNowButton);
    Freedoms_Release(_homeButton);
    Freedoms_Release(_tableView);
    Freedoms_Release(_cityTextfield);
    Freedoms_Release(_weatherInfoKeys);
    Freedoms_Release(_weatherKeysDict);
    Freedoms_Release(_citysDict);
    Freedoms_Release(_sendSevenButton);
    Freedoms_Release(_sendTodayButton);
    [super dealloc];
}

#pragma mark - init
-(void) initData
{
    _weatherKeysDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [_weatherKeysDict setObject:@"城市" forKey:@"city"];
    [_weatherKeysDict setObject:@"城市代码" forKey:@"cityid"];
    [_weatherKeysDict setObject:@"风向" forKey:@"WD"];
    [_weatherKeysDict setObject:@"发布时间" forKey:@"time"];
    [_weatherKeysDict setObject:@"湿度" forKey:@"SD"];
    [_weatherKeysDict setObject:@"风速" forKey:@"WS"];
    [_weatherKeysDict setObject:@"WSE" forKey:@"WSE"];
    [_weatherKeysDict setObject:@"isRadar" forKey:@"isRadar"];
    [_weatherKeysDict setObject:@"Radar" forKey:@"Radar"];
    [_weatherKeysDict setObject:@"温度" forKey:@"temp"];
    [_weatherKeysDict setObject:@"英文名" forKey:@"city_en"];
    [_weatherKeysDict setObject:@"日期" forKey:@"date_y"];
    [_weatherKeysDict setObject:@"阴历年" forKey:@"date"];
    [_weatherKeysDict setObject:@"星期" forKey:@"week"];
    [_weatherKeysDict setObject:@"fchh" forKey:@"fchh"];
    [_weatherKeysDict setObject:@"更新时间" forKey:@"ptime"];

    [_weatherKeysDict setObject:@"未来3天摄氏温度" forKey:@"temp3"];
    [_weatherKeysDict setObject:@"未来4天摄氏温度" forKey:@"temp4"];
    [_weatherKeysDict setObject:@"未来5天摄氏温度" forKey:@"temp5"];
    [_weatherKeysDict setObject:@"未来6天摄氏温度" forKey:@"temp6"];
    
    [_weatherKeysDict setObject:@"未来1天华氏温度" forKey:@"tempF1"];
    [_weatherKeysDict setObject:@"未来2天华氏温度" forKey:@"tempF2"];
    [_weatherKeysDict setObject:@"未来3天华氏温度" forKey:@"tempF3"];
    [_weatherKeysDict setObject:@"未来4天华氏温度" forKey:@"tempF4"];
    [_weatherKeysDict setObject:@"未来5天华氏温度" forKey:@"tempF5"];
    [_weatherKeysDict setObject:@"未来6天华氏温度" forKey:@"tempF6"];
    
    [_weatherKeysDict setObject:@"天气" forKey:@"weather"];
    [_weatherKeysDict setObject:@"未来1天天气" forKey:@"weather1"];
    [_weatherKeysDict setObject:@"未来2天天气" forKey:@"weather2"];
    [_weatherKeysDict setObject:@"未来3天天气" forKey:@"weather3"];
    [_weatherKeysDict setObject:@"未来4天天气" forKey:@"weather4"];
    [_weatherKeysDict setObject:@"未来5天天气" forKey:@"weather5"];
    [_weatherKeysDict setObject:@"未来6天天气" forKey:@"weather6"];
    
    [_weatherKeysDict setObject:@"未来1天风速" forKey:@"wind1"];
    [_weatherKeysDict setObject:@"未来2天风速" forKey:@"wind2"];
    [_weatherKeysDict setObject:@"未来3天风速" forKey:@"wind3"];
    [_weatherKeysDict setObject:@"未来4天风速" forKey:@"wind4"];
    [_weatherKeysDict setObject:@"未来5天风速" forKey:@"wind5"];
    [_weatherKeysDict setObject:@"未来6天风速" forKey:@"wind6"];
    
    [_weatherKeysDict setObject:@"今天穿衣指数" forKey:@"index"];
    [_weatherKeysDict setObject:@"今天穿衣指数d" forKey:@"index_d"];
    [_weatherKeysDict setObject:@"48小时穿衣指数" forKey:@"index48"];
    [_weatherKeysDict setObject:@"48小时穿衣指数d" forKey:@"index48_d"];
    
    [_weatherKeysDict setObject:@"今天紫外线强度" forKey:@"index_uv"];
    [_weatherKeysDict setObject:@"48小时紫外线强度" forKey:@"index48_uv"];
    
    [_weatherKeysDict setObject:@"洗车指数" forKey:@"index_xc"];
    [_weatherKeysDict setObject:@"旅游指数" forKey:@"index_tr"];
    [_weatherKeysDict setObject:@"舒适指数" forKey:@"index_co"];
    [_weatherKeysDict setObject:@"晨练指数" forKey:@"index_cl"];
    [_weatherKeysDict setObject:@"晾晒指数" forKey:@"index_ls"];
    [_weatherKeysDict setObject:@"过敏指数" forKey:@"index_ag"];
    //天气图片
    [_weatherKeysDict setObject:@"img1" forKey:@"img1"];
    [_weatherKeysDict setObject:@"img2" forKey:@"img2"];
    [_weatherKeysDict setObject:@"img3" forKey:@"img3"];
    [_weatherKeysDict setObject:@"img4" forKey:@"img4"];
    [_weatherKeysDict setObject:@"img5" forKey:@"img5"];
    [_weatherKeysDict setObject:@"img6" forKey:@"img6"];
    [_weatherKeysDict setObject:@"img7" forKey:@"img7"];
    [_weatherKeysDict setObject:@"img8" forKey:@"img8"];
    [_weatherKeysDict setObject:@"img9" forKey:@"img9"];
    [_weatherKeysDict setObject:@"img10" forKey:@"img10"];
    [_weatherKeysDict setObject:@"img11" forKey:@"img11"];
    [_weatherKeysDict setObject:@"img12" forKey:@"img12"];
    [_weatherKeysDict setObject:@"img_single" forKey:@"img_single"];
    
    [_weatherKeysDict setObject:@"img_title1" forKey:@"img_title1"];
    [_weatherKeysDict setObject:@"img_title2" forKey:@"img_title2"];
    [_weatherKeysDict setObject:@"img_title3" forKey:@"img_title3"];
    [_weatherKeysDict setObject:@"img_title4" forKey:@"img_title4"];
    [_weatherKeysDict setObject:@"img_title5" forKey:@"img_title5"];
    [_weatherKeysDict setObject:@"img_title6" forKey:@"img_title6"];
    [_weatherKeysDict setObject:@"img_title7" forKey:@"img_title7"];
    [_weatherKeysDict setObject:@"img_title8" forKey:@"img_title8"];
    [_weatherKeysDict setObject:@"img_title9" forKey:@"img_title9"];
    [_weatherKeysDict setObject:@"img_title10" forKey:@"img_title10"];
    [_weatherKeysDict setObject:@"img_title11" forKey:@"img_title11"];
    [_weatherKeysDict setObject:@"img_title12" forKey:@"img_title12"];
    [_weatherKeysDict setObject:@"img_title_single" forKey:@"img_title_single"];
    //风级
    [_weatherKeysDict setObject:@"fx1" forKey:@"fx1"];
    [_weatherKeysDict setObject:@"fx2" forKey:@"fx2"];
    [_weatherKeysDict setObject:@"未来1天风级" forKey:@"fl1"];
    [_weatherKeysDict setObject:@"未来2天风级" forKey:@"fl2"];
    [_weatherKeysDict setObject:@"未来3天风级" forKey:@"fl3"];
    [_weatherKeysDict setObject:@"未来4天风级" forKey:@"fl4"];
    [_weatherKeysDict setObject:@"未来5天风级" forKey:@"fl5"];
    [_weatherKeysDict setObject:@"未来6天风级" forKey:@"fl6"];
    //未知
    [_weatherKeysDict setObject:@"st1" forKey:@"st1"];
    [_weatherKeysDict setObject:@"st2" forKey:@"st2"];
    [_weatherKeysDict setObject:@"st3" forKey:@"st3"];
    [_weatherKeysDict setObject:@"st4" forKey:@"st4"];
    [_weatherKeysDict setObject:@"st5" forKey:@"st5"];
    [_weatherKeysDict setObject:@"st6" forKey:@"st6"];
    
    _citysDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSArray *temp = [CITY componentsSeparatedByString:@":"];
    for (int i= 0; i < [temp count] - 1; i ++) {
        if (i ==0) {
            [_citysDict setObject:[[temp objectAtIndex:i+1] substringWithRange:NSMakeRange(0, 9)] forKey:[temp objectAtIndex:i]];
        }else{
            [_citysDict setObject:[[temp objectAtIndex:i+1] substringWithRange:NSMakeRange(0, 9)] forKey:[[temp objectAtIndex:i] substringFromIndex:9]];
        }
    }
}

-(void) initUIView
{
    
    _homeButton = [[UIBarButtonItem alloc] initWithTitle:@"home" style:UIBarButtonItemStyleBordered target:self action:@selector(homeAction)];
    self.navigationItem.rightBarButtonItem = _homeButton;
    
    self.title = @"AFNetworking";
    
    _sendNowButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _sendNowButton.frame = CGRECT_NOW_BUTTON;
    [_sendNowButton setTitle:@"实时天气" forState:UIControlStateNormal];
    [_sendNowButton addTarget:self action:@selector(nowAction) forControlEvents:UIControlEventTouchUpInside];
    [_sendTodayButton setTag:0];
    [self.view addSubview:_sendNowButton];
    
    _sendSevenButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _sendSevenButton.frame = CGRECT_SEVEN_BUTTON;
    [_sendSevenButton setTitle:@"7天预报" forState:UIControlStateNormal];
    [_sendSevenButton addTarget:self action:@selector(sevenAction) forControlEvents:UIControlEventTouchUpInside];
    [_sendTodayButton setTag:1];
    [self.view addSubview:_sendSevenButton];
    
    _sendTodayButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _sendTodayButton.frame = CGRECT_TODAY_BUTTON;
    [_sendTodayButton setTitle:@"今天天气" forState:UIControlStateNormal];
    [_sendTodayButton addTarget:self action:@selector(todayAction) forControlEvents:UIControlEventTouchUpInside];
    [_sendTodayButton setTag:2];
    [self.view addSubview:_sendTodayButton];
    
    
    _cityTextfield = [[UITextField alloc] initWithFrame:CGRECT_TEXTFIELD];
    _cityTextfield.placeholder = @"请输入城市名";
    _cityTextfield.borderStyle = UITextBorderStyleRoundedRect;
    _cityTextfield.keyboardAppearance = UIKeyboardAppearanceAlert;
    _cityTextfield.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _cityTextfield.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _cityTextfield.autocapitalizationType = UIViewAutoresizingNone;
    _cityTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    _cityTextfield.returnKeyType = UIReturnKeyDefault;
    _cityTextfield.delegate = self;
    [self.view addSubview:_cityTextfield];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRECT_TABLEVIEW style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - UI Action
-(void)homeAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)sendRequest:(NSURLRequest *)request
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFJSONRequestOperation *jsonRequest = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"SUCCESS");
        _weatherDict = (NSDictionary *)JSON;
        NSDictionary *weatherInfo = [_weatherDict objectForKey:@"weatherinfo"];
        _weatherInfoKeys = [[weatherInfo allKeys] retain];
        _weatherArray = [[NSMutableArray arrayWithCapacity:0] retain];
        for (NSString *weatherInfoKey in _weatherInfoKeys) {
            [_weatherArray addObject:[weatherInfo objectForKey:weatherInfoKey]];
        }
        [_tableView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"FAIL");
    }];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]]; // -1016
    [jsonRequest start];
}

-(void) nowAction
{
    [_cityTextfield resignFirstResponder];
    NSURL *url = nil;
    NSString *cityCode = [_citysDict objectForKey:[_cityTextfield text]];
    if (cityCode) {
        url = [NSURL URLWithString:[[NOW stringByAppendingString:cityCode]stringByAppendingString:@".html"]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self sendRequest:request];
        Freedoms_Release(request);
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"请输入正确的地区名称" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        Freedoms_Release(alertView);
    }
}

-(void) sevenAction
{
    [_cityTextfield resignFirstResponder];
    [_weatherKeysDict setObject:@"未来1天摄氏温度" forKey:@"temp1"];
    [_weatherKeysDict setObject:@"未来2天摄氏温度" forKey:@"temp2"];
    NSURL *url = nil;
    NSString *cityCode = [_citysDict objectForKey:[_cityTextfield text]];
    if (cityCode) {
        url = [NSURL URLWithString:[[SEVEN stringByAppendingString:cityCode]stringByAppendingString:@".html"]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self sendRequest:request];
        Freedoms_Release(request);
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"请输入正确的地区名称" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        Freedoms_Release(alertView);
    }
}

-(void) todayAction
{
    [_cityTextfield resignFirstResponder];
    [_weatherKeysDict setObject:@"最高气温" forKey:@"temp1"];
    [_weatherKeysDict setObject:@"最低气温" forKey:@"temp2"];
    NSURL *url = nil;
    NSString *cityCode = [_citysDict objectForKey:[_cityTextfield text]];
    if (cityCode) {
        url = [NSURL URLWithString:[[TODAY stringByAppendingString:cityCode]stringByAppendingString:@".html"]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self sendRequest:request];
        Freedoms_Release(request);
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"请输入正确的地区名称" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        Freedoms_Release(alertView);
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *title = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:title];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:title] autorelease];
    }
    cell.textLabel.text = [[[_weatherKeysDict objectForKey:[_weatherInfoKeys objectAtIndex:indexPath.row]] stringByAppendingString:@":" ] stringByAppendingString: [_weatherArray objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewRowAnimationNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *weatherInfoDict = [_weatherDict objectForKey:@"weatherinfo"];
    return [[weatherInfoDict allKeys] count];
}
@end
