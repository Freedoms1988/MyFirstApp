//
//  YellowViewController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-19.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController
#pragma mark - ViewController Life Circle
- (id)init
{
    self = [super init];
    if (self) {
        UITabBarItem *tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Yellow" image:[UIImage imageNamed:@"yellow.png"] tag:1];
		self.tabBarItem=tabBarItem;
		Freedoms_Release(tabBarItem);
    }
    return self;
}

- (void)viewDidLoad
{
	self.view.backgroundColor=[UIColor yellowColor];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
