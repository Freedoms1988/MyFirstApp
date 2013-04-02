//
//  BlueViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-19.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController
#pragma mark - ViewController Life Circle
- (id)init
{
    self = [super init];
    if (self) {
		UITabBarItem *tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Blue" image:[UIImage imageNamed:@"blue.png"] tag:0];
		self.tabBarItem=tabBarItem;
		Freedoms_Release(tabBarItem);
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
