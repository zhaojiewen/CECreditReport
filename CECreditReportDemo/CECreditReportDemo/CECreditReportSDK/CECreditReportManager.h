//
//  CECreditReportManager.h
//  CECreditReportSDK
//
//  Created by 宜信 on 16/6/15.
//  Copyright © 2016年 宜信. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ CEVoidBlock) (void);

@interface CECreditReportManager : NSObject

+ (CECreditReportManager*)sharedInstance;

//*** 设置 rootViewController ，通过 present 方式来展现征信报告视图 ***//
@property (nonatomic, weak) UIViewController *rootViewController;

//*** 商户ID ***//
@property (nonatomic, copy) NSString *merchId;

//*** 唯一标示 用户ID ***//
@property (nonatomic, copy) NSString *userId;

//*** 私钥本地路径 ***//
@property (nonatomic, copy) NSString *p12Path;

//*** 私钥密码 ***//
@property (nonatomic, copy) NSString *p12Password;

//*** 用户名，如果传入就会在注册征信时自动填充 ***//
@property (nonatomic, copy) NSString *userName;

//*** 用户身份证号，如果传入就会在注册征信时自动填充 ***//
@property (nonatomic, copy) NSString *identifyId;

//*** 设置导航栏背景色, 默认蓝色,如果设置为白色，需要更换Resource内 “nv_back” 图片资源 ***//
@property (nonatomic, strong) UIColor *navigationBackgroundColor;

/* You may specify the font, text color, and shadow properties for the title in the text attributes dictionary, using the keys found in NSAttributedString.h.
 */
//*** 设置导航栏title 样式, 默认18字号 , 白色 ***//
@property (nonatomic, strong) NSDictionary *navigationTitleAttributes;

//*** dismiss 征信报告首页面后 ***//
@property (nonatomic, copy) CEVoidBlock dismissBlock;

//*** 开启征信服务，验证一系列必要参数 ***//
-(void)startGetCRP;


@end
