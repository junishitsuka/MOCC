//
//  FirstViewController.h
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/18.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITextView *qText;
    UITextView *aText;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *dataSourceAnswers;
@property (nonatomic, strong) NSArray *dataSourceQuestions;

@end
