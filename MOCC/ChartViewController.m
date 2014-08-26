//
//  ChartViewController.m
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/22.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "ChartViewController.h"

@implementation ChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self createNavigation];
    [self createTableView];
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

- (void)createTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 不要なセルを消去
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.backgroundColor = [UIColor clearColor];
    [self.tableView setTableHeaderView:v];
    [self.tableView setTableFooterView:v];
    
    // 看護師データベタ書き
    self.dataSource = @[@{@"name":@"小林 明美", @"department":@"内科", @"rating":@"3.0", @"distance":@"30m", @"online":@"on", @"image":@"face1.png",@"date":@"5/26",@"category":@"子どもの相談",@"time":@"12分38秒"}, @{@"name":@"関 典子", @"department":@"小児科", @"rating":@"4.0", @"distance":@"300m", @"online":@"on", @"image":@"face2.png",@"date":@"7/14",@"category":@"子どもの相談",@"time":@"9分11秒"}];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    cell =  [tableView dequeueReusableCellWithIdentifier:@"consultCell"];
    
    label1 = (UILabel *)[cell viewWithTag:1];
    label2 = (UILabel *)[cell viewWithTag:2];
    label3 = (UILabel *)[cell viewWithTag:3];
    image = (UIImageView *) [cell viewWithTag:4];
    label4 = (UILabel *)[cell viewWithTag:5];
    label5 = (UILabel *)[cell viewWithTag:6];
    label6 = (UILabel *)[cell viewWithTag:7];
    label7 = (UILabel *)[cell viewWithTag:8];
    
    label1.text = self.dataSource[indexPath.row][@"date"];
    label2.text = self.dataSource[indexPath.row][@"category"];
    label3.text = self.dataSource[indexPath.row][@"time"];
    label4.text = self.dataSource[indexPath.row][@"name"];
    label5.text = self.dataSource[indexPath.row][@"department"];
    label6.text = self.dataSource[indexPath.row][@"distance"];
    label7.text = self.dataSource[indexPath.row][@"rating"];
    image.image = [UIImage imageNamed:self.dataSource[indexPath.row][@"image"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0f;
}
 */

@end
