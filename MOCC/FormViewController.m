//
//  FormViewController.m
//  MOCC
//
//  Created by Ishitsuka Jun on 2014/08/18.
//  Copyright (c) 2014年 Ishitsuka Jun. All rights reserved.
//

#import "FormViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ListViewController.h"
#import "scrollViewController.h"

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self createView];
    self.categoryTextField.delegate = self;
    self.areaTextField.delegate = self;
    self.scrollView.delegate = self;

    // キーボードのアクションを監視
    [self registerForKeyboardNotifications];    
}

- (void)createView {
    // textViewのボーダーを設定（角丸・水色）
    self.textView.layer.borderWidth = 1.0f;
    self.textView.layer.cornerRadius = 5.0f;
    self.textView.layer.borderColor = [[UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0] CGColor];
    
    self.categoryTextField.layer.borderWidth = 1.0f;
    self.categoryTextField.layer.cornerRadius = 5.0f;
    self.categoryTextField.layer.borderColor = [[UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0] CGColor];
    
    self.areaTextField.layer.borderWidth = 1.0f;
    self.areaTextField.layer.cornerRadius = 5.0f;
    self.areaTextField.layer.borderColor = [[UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0] CGColor];
    
    self.segmentedControl.tintColor = [UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0];
    
    self.submitButton.layer.borderWidth = 1.0f;
    self.submitButton.layer.cornerRadius = 5.0f;
    self.submitButton.layer.borderColor = [[UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0] CGColor];
    self.submitButton.backgroundColor = [UIColor colorWithRed:0.31 green:0.76 blue:0.91 alpha:1.0];

    // 順にNavigationBarの背景、戻るボタン、タイトル
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.00 green:0.35 blue:0.38 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reflesh.png"] style:UIBarButtonItemStyleBordered target: self action: nil];
    self.navigationItem.rightBarButtonItem = barButton;
    
}

// キーボード以外の場所をタップするとキーボードを閉じるアクション(textField or textView)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITextField class]] || [obj isKindOfClass:[UITextView class]]) {
            [obj resignFirstResponder];
        }
    }];
}

-(void)keyboardWillShow:(NSNotification*)note {
    // キーボードの表示完了時の場所と大きさを取得
    CGRect keyboardFrameEnd = [[note.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    float screenHeight = screenBounds.size.height;
    
    if((activeField.frame.origin.y + activeField.frame.size.height)>(screenHeight - keyboardFrameEnd.size.height - 80)){
    	// テキストフィールドがキーボードで隠れるようならスクロールビューの位置を上げる
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.scrollView.frame = CGRectMake(0, screenHeight - activeField.frame.origin.y - activeField.frame.size.height - keyboardFrameEnd.size.height - 80, self.scrollView.frame.size.width,self.scrollView.frame.size.height);
                         }];
    }
    
}

// メンバ変数activeFieldに選択されたテキストフィールドを代入
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    activeField = textField;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // viewのy座標を元に戻してキーボードをしまう
    [UIView animateWithDuration:0.2 animations:^{
        self.scrollView.frame = CGRectMake(0, 0, self.scrollView.frame.size.width,self.scrollView.frame.size.height);
    }];
    
    [textField resignFirstResponder];
    return YES;

}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"Submit"] ) {
        ListViewController *nextViewController = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
        nextViewController.category = self.categoryTextField.text;
        nextViewController.contents = self.textView.text;
        nextViewController.area = self.areaTextField.text;
        switch (self.segmentedControl.selectedSegmentIndex) {
            case 0:
                nextViewController.emergency = @"緊急度低い";
                break;
            case 1:
                nextViewController.emergency = @"緊急度普通";
                break;
            default:
                nextViewController.emergency = @"緊急度高い";
                break;
        }
    }
}

@end