//
//  MyNavigationController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-3-18.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "MyNavigationController.h"
#import "MainViewController.h"
@interface MyNavigationController ()

@end

@implementation MyNavigationController
#pragma mark - ViewController Life Circle

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
#pragma mark - AutoRotate Controll
-(BOOL)shouldAutorotate
{
	return self.topViewController.shouldAutorotate;
}
-(NSUInteger)supportedInterfaceOrientations
{
	return self.topViewController.supportedInterfaceOrientations;
}
//-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//	[self.topViewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
//}
@end
