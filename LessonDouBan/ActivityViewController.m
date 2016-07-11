//
//  ActivityViewController.m
//  LessonDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityRequest.h"

@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *activityTableView;

@property (strong, nonatomic) NSMutableArray *allActivity;


@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityTableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identify];
    self.allActivity = [NSMutableArray array];
    [self requestActivityData];
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.allActivity.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identify];
    
    cell.model = self.allActivity[indexPath.row];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 198;
    
}

// 活动
- (void)requestActivityData {
    __weak typeof(self) weakSelf = self;
    ActivityRequest *activity = [[ActivityRequest alloc] init];
    [activity activityRequestWithParameter:nil success:^(NSDictionary *dic) {
        
        NSArray *events = [dic objectForKey:@"events"];
        
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [[ActivityModel alloc] init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.allActivity addObject:model];
            
        }
        NSLog(@"%@",weakSelf.allActivity);
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
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
