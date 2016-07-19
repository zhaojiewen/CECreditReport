#CECreditReport SDK 接入指南

## 1. 使用 CocoaPods 管理依赖
<b>项目根目录编辑Podfile</b>

	platform :ios, '7.0'
	xcodeproj 'MyApp/MyApp.xcodeproj'
	target 'MyApp' do
	  pod 'CECreditReport'
	end

## 2. 手动导入SDK
#### 按照以下步骤将SDK导入到您的项目中。

* 解压 CECreditReportSDK 压缩文件；
* 添加 CECreditReportManager.h , libCECreditReportSDK.a ,Resource.bundle添加到您的 iOS 工程中；
* 查看RSA密码生成说明文件生成私钥,添加私钥文件到工程

<b>提醒:</b>`记得勾选 "Copy items if needed"`

## 3. 添加编译参数

#### 在您的工程项目中添加编译参数

 <p><b>1. </b> 找到 Linking 设置 
  在 Other Linker Flags 中添加 -all_load 参数，请注意大小写</p>
  <b>2. </b>找到Info.list 文件添加
  
	    <key>NSAppTransportSecurity</key>
	    <dict>
	        <key>NSAllowsArbitraryLoads</key>
	        <true/>
	    </dict>

<b>提醒:</b> `Linking 设置位于 项目设置 target -> 选项卡 Build Settings，左上角选择 All。`







## 4.添加初始化函数
####在需要显示征信报告页调用API
	CECreditReportManager *creditReportManager = [CECreditReportManager sharedInstance];    creditReportManager.rootViewController = self;    creditReportManager.userId = @"xxxxxxxxxx";    creditReportManager.merchId = @"xxxxxxxxx";
    
    //*** 必须生成私钥请查看RSA密码生成说明文件 ***//    creditReportManager.p12Path = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"]	creditReportManager.p12Password = @"xxxxxxx";
	    //*** 可自定义导航栏背景色和导航栏title样式***//    [CECreditReportManager sharedInstance].navigationBackgroundColor = [UIColor blueColor];
    [CECreditReportManager sharedInstance].navigationTitleAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor colorWithRed:1 green:0 blue:0 alpha:0]};    __weak typeof(self) weakSelf = self;    creditReportManager.dismissBlock = ^(){        __strong typeof(weakSelf) strongSelf = weakSelf;      //*** 可选, 征信退出后,处理适配操作，比如导航栏、状态栏等. ***//    };    [creditReportManager startGetCRP];