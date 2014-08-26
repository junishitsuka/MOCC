//
//  SettingsViewController.m
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/22.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self createNavigation];
}

- (void)createNavigation {
    // 順にNavigationBarの背景、戻るボタン、タイトル
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.00 green:0.35 blue:0.38 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    // 更新ボタンを右上に設置
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reflesh.png"] style:UIBarButtonItemStyleBordered target: self action: nil];
    self.navigationItem.rightBarButtonItem = barButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
