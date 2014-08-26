//
//  ListViewController.m
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/21.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "ListViewController.h"
#import "NurseViewController.h"

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 更新ボタンを右上に設置
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reflesh.png"] style:UIBarButtonItemStyleBordered target: self action: nil];
    self.navigationItem.rightBarButtonItem = barButton;
    
    self.sortSegment.tintColor = [UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0];
    
    self.emergencyLabel.text = self.emergency;
    self.categoryLabel.text = self.category;
    
    [self createTableView];

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
    self.dataSourceNear = @[@{@"name":@"小林 明美", @"department":@"内科", @"rating":@"3.0", @"distance":@"30m", @"online":@"on", @"image":@"face1.png"},
                            @{@"name":@"関 典子", @"department":@"小児科", @"rating":@"4.0", @"distance":@"300m", @"online":@"on", @"image":@"face2.png"},
                            @{@"name":@"秋田 恵", @"department":@"内科", @"rating":@"5.0", @"distance":@"1km", @"online":@"off", @"image":@"face3.png"},
                            @{@"name":@"大橋 千鶴", @"department":@"産科", @"rating":@"2.0", @"distance":@"10km", @"online":@"off", @"image":@"face4.png"}];
    self.dataSourceRating = @[@{@"name":@"秋田 恵", @"department":@"内科", @"rating":@"5.0", @"distance":@"1km", @"online":@"off", @"image":@"face3.png"},
                              @{@"name":@"関 典子", @"department":@"小児科", @"rating":@"4.0", @"distance":@"300m", @"online":@"on", @"image":@"face2.png"},
                              @{@"name":@"小林 明美", @"department":@"内科", @"rating":@"3.0", @"distance":@"30m", @"online":@"on", @"image":@"face1.png"},
                              @{@"name":@"大橋 千鶴", @"department":@"産科", @"rating":@"2.0", @"distance":@"10km", @"online":@"off", @"image":@"face4.png"}];
    self.dataSourceSoon = @[@{@"name":@"小林 明美", @"department":@"内科", @"rating":@"3.0", @"distance":@"30m", @"online":@"on", @"image":@"face1.png"},
                            @{@"name":@"関 典子", @"department":@"小児科", @"rating":@"4.0", @"distance":@"300m", @"online":@"on", @"image":@"face2.png"},
                            @{@"name":@"秋田 恵", @"department":@"内科", @"rating":@"5.0", @"distance":@"1km", @"online":@"off", @"image":@"face3.png"},
                            @{@"name":@"大橋 千鶴", @"department":@"産科", @"rating":@"2.0", @"distance":@"10km", @"online":@"off", @"image":@"face4.png"}];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger dataCount;
    switch ((self.sortSegment.selectedSegmentIndex) ? self.sortSegment.selectedSegmentIndex : 0) {
        case 0:
            dataCount = self.dataSourceNear.count;
            break;
        case 1:
            dataCount = self.dataSourceRating.count;
            break;
        default:
            dataCount = self.dataSourceSoon.count;
            break;
    }
    return dataCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell =  [tableView dequeueReusableCellWithIdentifier:@"nurseCell"];
    
    switch ((self.sortSegment.selectedSegmentIndex) ? self.sortSegment.selectedSegmentIndex : 0) {
        case 0:
            label1 = (UILabel *)[cell viewWithTag:1];
            label2 = (UILabel *)[cell viewWithTag:2];
            label3 = (UILabel *)[cell viewWithTag:3];
            label4 = (UILabel *)[cell viewWithTag:4];
            image = (UIImageView *) [cell viewWithTag:5];

            label1.text = self.dataSourceNear[indexPath.row][@"name"];
            label2.text = self.dataSourceNear[indexPath.row][@"department"];
            label3.text = self.dataSourceNear[indexPath.row][@"distance"];
            label4.text = self.dataSourceNear[indexPath.row][@"rating"];
            image.image = [UIImage imageNamed:self.dataSourceNear[indexPath.row][@"image"]];
            break;
        case 1:
            label1 = (UILabel *)[cell viewWithTag:1];
            label2 = (UILabel *)[cell viewWithTag:2];
            label3 = (UILabel *)[cell viewWithTag:3];
            label4 = (UILabel *)[cell viewWithTag:4];
            image = (UIImageView *) [cell viewWithTag:5];
            
            label1.text = self.dataSourceRating[indexPath.row][@"name"];
            label2.text = self.dataSourceRating[indexPath.row][@"department"];
            label3.text = self.dataSourceRating[indexPath.row][@"distance"];
            label4.text = self.dataSourceRating[indexPath.row][@"rating"];
            image.image =[UIImage imageNamed:self.dataSourceRating[indexPath.row][@"image"]];
            break;
        default:
            label1 = (UILabel *)[cell viewWithTag:1];
            label2 = (UILabel *)[cell viewWithTag:2];
            label3 = (UILabel *)[cell viewWithTag:3];
            label4 = (UILabel *)[cell viewWithTag:4];
            image = (UIImageView *) [cell viewWithTag:5];
            
            label1.text = self.dataSourceSoon[indexPath.row][@"name"];
            label2.text = self.dataSourceSoon[indexPath.row][@"department"];
            label3.text = self.dataSourceSoon[indexPath.row][@"distance"];
            label4.text = self.dataSourceSoon[indexPath.row][@"rating"];
            image.image =[UIImage imageNamed:self.dataSourceSoon[indexPath.row][@"image"]];
            break;
    }
    
    return cell;
}

- (IBAction)changeSeg:(id)sender {
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除
    NurseViewController *nurseViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NurseViewController"];
    [self.navigationController pushViewController:nurseViewController animated:YES];
     */
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"nurseSegue" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"nurseSegue"] ) {
        NurseViewController *nextViewController = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
        // nextViewController.image = self.categoryTextField.text;
        // nextViewController.name = self.textView.text;
    }
}

@end