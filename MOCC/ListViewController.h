//
//  ListViewController.h
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/21.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UIImageView *image;
}

@property NSString *category;
@property NSString *contents;
@property NSString *emergency;
@property NSString *area;

@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (nonatomic, strong) NSArray *dataSourceNear;
@property (nonatomic, strong) NSArray *dataSourceRating;
@property (nonatomic, strong) NSArray *dataSourceSoon;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@property (weak, nonatomic) IBOutlet UILabel *emergencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortSegment;

- (IBAction)changeSeg:(id)sender;

@end