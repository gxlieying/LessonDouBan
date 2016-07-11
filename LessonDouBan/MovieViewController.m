//
//  MovieViewController.m
//  LessonDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "MovieViewController.h"
#import <UMSocialSnsService.h>
#import <UMSocial.h>

@interface MovieViewController ()<UMSocialUIDelegate>

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 分享按钮
    UIBarButtonItem *shareBI = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(shareAction:)];
    self.navigationItem.rightBarButtonItems = @[shareBI];
}

#pragma mark -- 分享按钮的响应方法
- (void)shareAction:(UIBarButtonItem *)item {
    
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5773ac0ae0f55aff1400263d"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social" // 分享的内容
                                     shareImage:[UIImage imageNamed:@"photo.jpg"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,UMShareToSina]
                                       delegate:self];
    
}

// 实现回调方法
- (void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response {
    
    // 根据responseCode得到发送的结果
    if (response.responseCode == UMSResponseCodeSuccess) {
        NSLog(@"分享成功");
    }else {
        NSLog(@"%d",response.responseCode);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
