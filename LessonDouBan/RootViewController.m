//
//  RootViewController.m
//  LessonDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"

@interface RootViewController ()<DouBanTabBarDelegate>

@property (nonatomic, strong) DouBanTabBar *dbTabBar;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"paper"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"paperH"]forState:UIControlStateSelected];
    btn1.imageEdgeInsets = UIEdgeInsetsMake(6, 12.5, 10.7, 10.7);
    [btn1 setTitle:@"活动" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:9];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn1.titleEdgeInsets = UIEdgeInsetsMake(30, -btn1.titleLabel.bounds.size.width-50, 0, 0);
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"videoH"] forState:UIControlStateSelected];
    btn2.imageEdgeInsets = UIEdgeInsetsMake(6, 12.5, 10.7, 10.7);
    [btn2 setTitle:@"电影" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:9];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn2.titleEdgeInsets = UIEdgeInsetsMake(30, -btn2.titleLabel.bounds.size.width-50, 0, 0);
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setImage:[UIImage imageNamed:@"2image"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"2imageH"] forState:UIControlStateSelected];
    btn3.imageEdgeInsets = UIEdgeInsetsMake(6, 12.5, 10.7, 10.7);
    [btn3 setTitle:@"影院" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:9];
    [btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn3.titleEdgeInsets = UIEdgeInsetsMake(30, -btn3.titleLabel.bounds.size.width-50, 0, 0);
    
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"personH"] forState:UIControlStateSelected];
    btn4.imageEdgeInsets = UIEdgeInsetsMake(6, 12.5, 10.7, 10.7);
    [btn4 setTitle:@"我的" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:9];
    [btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn4.titleEdgeInsets = UIEdgeInsetsMake(30, -btn4.titleLabel.bounds.size.width-50, 0, 0);
    
    self.dbTabBar = [[DouBanTabBar alloc]initWithItems:@[btn1,btn2,btn3,btn4] frame:CGRectMake(0, WindowHeight - 49, WindowWidth, 49)];
    
    [self.view addSubview:self.dbTabBar];
    self.dbTabBar.DouBanDelegate = self;
    
    // [self setValue:self.dbTabBar forKey:@"tabBar"];
    
}


- (void)DouBanItemDidClicked:(DouBanTabBar *)tabBar {
    
    self.selectedIndex = tabBar.currentSelected;
    //self.selectedViewController = [self.viewControllers objectAtIndex:tabBar.currentSelected];
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
