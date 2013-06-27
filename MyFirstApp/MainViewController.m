//
//  ViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-6.
//  Copyright (c) 2013年 Freedoms. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController()
{
    NSArray *_tableDataArray;
    UIBarButtonItem *_rightItem;
}
@end

@implementation MainViewController

#pragma mark - ViewController Life circle

- (void)viewDidLoad
{
    _tableDataArray = [[NSMutableArray arrayWithObjects:@"UI控件",@"Tabbar",@"Picker",@"Tiger",@"Sqlite",@"CoreGraphics",@"GsetureRecognizer",@"Demo",@"CoreAnimation",@"AFNetWorking天气预报",nil] retain];
    _rightItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target:self action:@selector(loginAction)];
    self.navigationItem.rightBarButtonItem = _rightItem;
    
    UITableView *tableView =  [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
	
	tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
	tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView reloadData];
    [tableView release];
	
	_userInfo=[[UserInfo alloc]init];
	_userDictionary=[[NSMutableDictionary alloc]init];
	
}

-(void)dealloc
{
    [_tableDataArray release];
    [_rightItem release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - SkipAction

-(void)loginAction
{
	if (_userInfo.usernameString == nil||_userInfo.passwordString==nil) {
		LoginViewController *loginViewController = [[LoginViewController alloc]init];
		loginViewController.delegate = self;
		[self.navigationController pushViewController:loginViewController animated:YES];
		Freedoms_Release(loginViewController);
	}else{
		_rightItem.title = @"登录";
		_userInfo.usernameString=nil;
		_userInfo.passwordString=nil;
	}
}

#pragma mark - TableView Method

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *title = @"table title";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:title];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:title] autorelease];
    }
	cell.textLabel.text = [_tableDataArray objectAtIndex:indexPath.row];
	cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

//选中某行事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (_userInfo.usernameString.length==0) {
		LoginViewController *loginViewController=[[LoginViewController alloc] init];
		loginViewController.delegate=self;
		[self.navigationController pushViewController:loginViewController animated:YES];
		Freedoms_Release(loginViewController);
	}else{
		switch (indexPath.row) {
			case 0:{
				UIController *uiController = [[UIController alloc] init];
				[self.navigationController pushViewController:uiController animated:YES];
				Freedoms_Release(uiController);
				break;
			}
			case 1:{
				TabbarViewController *tabbarViewController = [[TabbarViewController alloc] init];
				[self.navigationController pushViewController:tabbarViewController animated:YES];
				Freedoms_Release(tabbarViewController);
				break;
			}
			case 2:{
				PickerViewController *pickerViewController=[[PickerViewController alloc] init];
				[self.navigationController pushViewController:pickerViewController animated:YES];
				Freedoms_Release(pickerViewController);
				break;
			}
			case 3:{
				TigerViewController *tigerViewController = [[TigerViewController alloc] init];
				[self.navigationController pushViewController:tigerViewController animated:YES];
				Freedoms_Release(tigerViewController);
				break;
			}
			case 4:{
				SqliteViewController *sqliteViewController = [[SqliteViewController alloc] init];
				[self.navigationController pushViewController:sqliteViewController animated:YES];
				Freedoms_Release(sqliteViewController);
				break;
			}
			case 5:{
				CoreGraphicsViewController *coreGraphicsViewController=[[CoreGraphicsViewController alloc]init];
				[self.navigationController pushViewController:coreGraphicsViewController animated:YES];
				Freedoms_Release(coreGraphicsViewController);
				break;
			}
			case 6:{
				GestureRecognizerViewController *gestureRecognizerViewController=[[GestureRecognizerViewController alloc] init];
				[self.navigationController pushViewController:gestureRecognizerViewController animated:YES];
				Freedoms_Release(gestureRecognizerViewController);
				break;
			}
			case 7:{
				DemoViewController *demoViewController=[[DemoViewController alloc] init];
				[self.navigationController pushViewController:demoViewController animated:YES];
				Freedoms_Release(demoViewController);
                break;
			}
            case 8:{
                CoreAnimationController *coreAnimationController=[[CoreAnimationController alloc] init];
                [self.navigationController pushViewController:coreAnimationController animated:YES];
                Freedoms_Release(coreAnimationController);
                break;
            }
            case 9:{
                AFNetWorkingViewController *afnetworkingViewController = [[AFNetWorkingViewController alloc] init];
                [self.navigationController pushViewController:afnetworkingViewController animated:YES];
                Freedoms_Release(afnetworkingViewController);
                break;
            }
		}
	}
}
//显示滑动删除按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}


#pragma mark - UIAction
-(void)loginUsername:(NSString *)username loginPassword:(NSString *)password
{
	_userInfo.usernameString=username;
	_userInfo.passwordString=password;
    _rightItem.title =[_userInfo.usernameString stringByAppendingString:@",您好"];
}

-(void)registUsername:(NSString *)usernameString registPassword:(NSString *)passwordString
{
	if (![_userDictionary objectForKey:usernameString]) {
		[_userDictionary setObject:passwordString forKey:usernameString];
	}else{
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Already exist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
		[alertView show];
		Freedoms_Release(alertView);
	}
}
@end
