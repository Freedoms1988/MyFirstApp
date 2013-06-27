//
//  CoreAnimationController.m
//  MyFirstApp
//
//  Created by Freedoms on 13-5-8.
//  Copyright (c) 2013年 周 忠亭. All rights reserved.
//

#import "CoreAnimationController.h"
#import "CAView.h"
@interface CoreAnimationController ()
{
    CAView *caView;
}
@end

@implementation CoreAnimationController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"CoreAnimation";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem=rightButton;
    Freedoms_Release(rightButton);
    caView = [[CAView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:caView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
    Freedoms_Release(caView);
}

- (void)rightButtonAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
