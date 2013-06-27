//
//  UIViewDemoController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-4-3.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "UIViewDemoController.h"

@interface UIViewDemoController ()
{
	NSArray *_tableViewArray;
	
}
@end

@implementation UIViewDemoController

#pragma mark - ViewController Life Circle
- (id)init
{
	self = [super init];
	if (self) {
		_tableViewArray = [[NSArray arrayWithObjects:@"Board",@"UIViewAnimation",nil] retain];
	}
	return self;
}

- (void)viewDidLoad
{
	self.title = @"UIViewDemo";
	
	UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemAction)];
	self.navigationItem.rightBarButtonItem=buttonItem;
	Freedoms_Release(buttonItem);
	UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
	tableView.delegate = self;
	tableView.dataSource = self;
	[self.view addSubview:tableView];
	Freedoms_Release(tableView);
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
	Freedoms_Release(_tableViewArray);
	[super dealloc];
}
#pragma mark - UIAction
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *title = @"cell string";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:title];
	if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:title] autorelease];
    }
	cell.textLabel.text = [_tableViewArray objectAtIndex:indexPath.row];
	cell.selectionStyle = UITableViewCellAccessoryNone;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
		case 0:
			
		break;
	}
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_tableViewArray count];
}

-(void)buttonItemAction
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
@end
