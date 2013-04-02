//
//  SqliteViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-21.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "SqliteViewController.h"
#define kTABLEVIEW_RECT CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 600.0f)
@interface SqliteViewController ()
{
	UITableView *_tableView;
	NSArray *_userArray;
	sqlite3 *_database;
}
@end

@implementation SqliteViewController
#pragma mark - ViewController Life Circle
- (void)viewDidLoad
{
	self.title=@"Sqlite";
	
	UIBarButtonItem *barButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"insert"
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:@selector(barButtonAction)];
	self.navigationItem.rightBarButtonItem=barButtonItem;
	Freedoms_Release(barButtonItem);
	
	_tableView = [[UITableView alloc]initWithFrame: kTABLEVIEW_RECT style:UITableViewStylePlain];
	_tableView.delegate=self;
	_tableView.dataSource=self;
	[_tableView reloadData];
	[self.view addSubview:_tableView];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{	Freedoms_Release(_tableView);
	Freedoms_Release(_userArray);
	[super dealloc];
}
#pragma mark - UIAction

-(void)barButtonAction
{
	[self updateData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_userArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	UITableViewCell *tableViewCell=[UITableViewCell alloc]INI
	return nil;
}

#pragma mark - SqliteAction
-(NSString *)filePath
{
	NSString *documentDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
	NSLog(@"%@",[documentDir stringByAppendingPathComponent:@"demo.sqlite"]);
	return [documentDir stringByAppendingPathComponent:@"demo.sqlite"];
}

-(void)openDatabase
{
	NSLog(@"%d",sqlite3_open([[self filePath] UTF8String],&_database));
	if(sqlite3_open([[self filePath] UTF8String],&_database) == SQLITE_OK){
		NSLog(@"open database success");
	}else{
		NSLog(@"open database failed");
		sqlite3_close(_database);
	}
}

-(void)createTable
{
	char *errorMsg;
	[self openDatabase];
	const char *createSql="CREATE TABLE IF NOT EXISTS USER_TABLE(ID INTEGER PRIMARY KEY AUTOINCREMENT,NAME TEXT)";
	if (sqlite3_exec(_database,createSql,NULL,NULL,&errorMsg)==SQLITE_OK) {
		NSLog(@"create usertable success");
	}else{
		NSLog(@"create usertable failed");
	}
	sqlite3_close(_database);
}

-(void)deleteTable
{
	char *errorMsg;
	[self openDatabase];
	const char *deleteSql="DROP TABLE USER_TABLE";
	if (sqlite3_exec(_database, deleteSql, NULL, NULL, &errorMsg) == SQLITE_OK) {
		NSLog(@"delete usertable success");
	}else{
		NSLog(@"delete usertable failed");
	}
	sqlite3_close(_database);
}

-(void)insertData
{
	char *errorMsg;
	[self openDatabase];
	const char *insertSql="INSERT INTO USER_TABLE(NAME) VALUES('张三')";
	if (sqlite3_exec(_database, insertSql, NULL, NULL, &errorMsg)==SQLITE_OK) {
		NSLog(@"insert success");
	}else{
		NSLog(@"insert failed");
	}
	sqlite3_close(_database);
}

-(void)deleteData
{
	char *errorMsg;
	[self openDatabase];
	const char *deleteSql="DELETE FROM USER_TABLE WHERE NAME ='张三'";
	if (sqlite3_exec(_database, deleteSql, NULL, NULL, &errorMsg)==SQLITE_OK) {
		NSLog(@"delete success");
	}else{
		NSLog(@"delete failed");
	}
	sqlite3_close(_database);
}

-(void)queryData
{
	[self openDatabase];
	const char *querySql="SELECT * FROM USER_TABLE";
	sqlite3_stmt *stmt;
	if (sqlite3_prepare_v2(_database, querySql, -1, &stmt, nil) == SQLITE_OK) {
		NSLog(@"query success");
		while (sqlite3_step(stmt) == SQLITE_ROW) {
			int id=sqlite3_column_int(stmt, 0);
			NSString *name=[[NSString alloc]initWithCString:(char *)sqlite3_column_text(stmt, 1) encoding:NSUTF8StringEncoding];
			NSLog(@"row>>id %i, name>> %@",id,name);
		}
	}
	sqlite3_close(_database);
}

-(void)updateData
{
	[self openDatabase];
	sqlite3_stmt *stmt;
	const char *updateSql="UPDATE USER_TABLE SET NAME='王五' WHERE ID = 4";
	if (sqlite3_prepare_v2(_database, updateSql, -1, &stmt, nil)==SQLITE_OK) {
		sqlite3_bind_text(stmt, 1, updateSql, -1, SQLITE_TRANSIENT);
		if (sqlite3_step(stmt)==SQLITE_OK) {
			sqlite3_reset(stmt);
			NSLog(@"update success");
		}
	}else{
		NSLog(@"update failed");
	}
	sqlite3_close(_database);
}
@end
