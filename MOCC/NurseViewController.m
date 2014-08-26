//
//  NurseViewController.m
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/22.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "NurseViewController.h"

@implementation NurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.segmentedControl.frame = CGRectMake(0, 255, 320, 45);
    self.callButton.layer.borderWidth = 1.0f;
    self.callButton.layer.cornerRadius = 5.0f;
    self.callButton.layer.borderColor = [[UIColor colorWithRed:1.00 green:0.35 blue:0.38 alpha:1.0] CGColor];
    self.callButton.backgroundColor = [UIColor colorWithRed:1.00 green:0.35 blue:0.38 alpha:1.0];
    self.segmentedControl.tintColor = [UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reflesh.png"] style:UIBarButtonItemStyleBordered target: self action: nil];
    self.navigationItem.rightBarButtonItem = barButton;

}


- (IBAction)tapButton:(id)sender {
    NSURL *url = [[NSURL alloc] initWithString:@"tel:080-1290-2932"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
