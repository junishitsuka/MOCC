//
//  FirstViewController.m
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/18.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.segmentedControl.tintColor = [UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0];
    
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
    
    // Q&Aデータベタ書き
    self.dataSourceQuestions = @[@"子供がおたふく風邪なのですが、どう対処をいいですか？", @"子供が喘息で、ひどくはないけど苦しそうなとき、どうしたらいいですか？病院が休みの時です", @"子供の切り傷について見てもらう科は、小児科でしょうか、外科でしょうか"];
    self.dataSourceAnswers = @[@"髄膜炎などの合併症が起こったりする可能性があります。おたふくはいわゆる感染病なので、すぐに病院に行きましょう", @"気管支拡張剤を常備しておいてもいいと思います。背中などに貼るだけのものもあります。ととにかく医師を話し合った方がいいです", @"けがの場合は外科の方がいいです。風邪などの内科系は小児科に連れて行くといいでしょう"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceAnswers.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell =  [tableView dequeueReusableCellWithIdentifier:@"questionsCell"];
    
    qText = (UITextView *)[cell viewWithTag:1];
    aText = (UITextView *)[cell viewWithTag:2];
    
    qText.text = self.dataSourceQuestions[indexPath.row];
    aText.text = self.self.dataSourceAnswers[indexPath.row];
    
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

@end
