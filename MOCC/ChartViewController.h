//
//  ChartViewController.h
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/22.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UILabel *label7;
    UIImageView *image;
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end