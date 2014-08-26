//
//  FormViewController.h
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/18.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormViewController : UIViewController <UIScrollViewDelegate,UITextFieldDelegate> {
    UITextField *activeField;
}

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *areaTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end