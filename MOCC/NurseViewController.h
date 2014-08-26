//
//  NurseViewController.h
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/22.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NurseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property NSString *name;
@property NSString *image;

- (IBAction)tapButton:(id)sender;

@end