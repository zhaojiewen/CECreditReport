//
//  ViewController.m
//  CECreditReportSDKDemo
//
//  Created by 宜信 on 16/6/16.
//  Copyright © 2016年 宜信. All rights reserved.
//

#import "ViewController.h"
#import "CECreditReportManager.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *userIdLabel;
@property (nonatomic,strong) UITextField *userIdTextField;
@property (nonatomic,strong) UILabel *merchIdLabel;
@property (nonatomic,strong) UITextField *merchIdTextField;
@property (nonatomic,strong) UILabel *isOpenSingleUsersLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

- (UILabel *)userIdLabel {
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc] init];
        _userIdLabel.text = @"userID：";
        _userIdLabel.font = [UIFont systemFontOfSize:16];
        _userIdLabel.textColor = [UIColor blackColor];
    }
    return _userIdLabel;
}

- (UITextField *)userIdTextField {
    if (!_userIdTextField) {
        _userIdTextField = [[UITextField alloc] init];
        _userIdTextField.layer.borderColor = [UIColor redColor].CGColor;
        _userIdTextField.layer.cornerRadius = 3;
        _userIdTextField.layer.borderWidth = 1;
    }
    return _userIdTextField;
}

- (UILabel *)merchIdLabel {
    if (!_merchIdLabel) {
        _merchIdLabel = [[UILabel alloc] init];
        _merchIdLabel.text = @"商户ID：";
        _merchIdLabel.font = [UIFont systemFontOfSize:16];
        _merchIdLabel.textColor = [UIColor blackColor];
        
    }
    return _merchIdLabel;
}

- (UITextField *)merchIdTextField {
    if (!_merchIdTextField) {
        _merchIdTextField = [[UITextField alloc] init];
        _merchIdTextField.layer.borderColor = [UIColor redColor].CGColor;
        _merchIdTextField.layer.cornerRadius = 3;
        _merchIdTextField.layer.borderWidth = 1;
    }
    return _merchIdTextField;
}


- (void)configUI{
    [self.view addSubview:self.userIdLabel];
    [self.view addSubview:self.userIdTextField];
    [self.view addSubview:self.merchIdLabel];
    [self.view addSubview:self.merchIdTextField];
    
    self.userIdLabel.frame = CGRectMake(15, 30, 100, 30);
    [self.userIdLabel sizeToFit];
    
    self.userIdTextField.frame = CGRectMake(CGRectGetMaxX(self.userIdLabel.frame
                                                          ), 30, 200, 30);
    self.userIdTextField.text = @"18513883229";
    self.merchIdLabel.frame = CGRectMake(15, 70, 100, 30);
    [self.merchIdLabel sizeToFit];
    self.merchIdTextField.text = @"000006";
    
    self.merchIdTextField.frame = CGRectMake(CGRectGetMaxX(self.merchIdLabel.frame
                                                           ), 70, 200, 30);
    
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width / 2 - 100;
    CGFloat y = [UIScreen mainScreen].bounds.size.height / 2 - 50;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, 100, 50)];
    [button setTitle:@"征信报告" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(creditReportButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)creditReportButtonClicked:(id)sender{
    //    merchantId=0000490&userId=15011126537&loginName=LIZ198604
    
    [CECreditReportManager sharedInstance].rootViewController = self;
    [CECreditReportManager sharedInstance].userId = self.userIdTextField.text;
    [CECreditReportManager sharedInstance].merchId = self.merchIdTextField.text;
    
    [CECreditReportManager sharedInstance].p12Path = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    [CECreditReportManager sharedInstance].p12Password = @"1qaz@WSX";
    [[CECreditReportManager sharedInstance] startGetCRP];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
