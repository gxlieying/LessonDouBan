//
//  ActivityTableViewCell.h
//  LessonDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

// 重用标识符
#define ActivityTableViewCell_Identify @"ActivityTableViewCell_Identify"

@interface ActivityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *partyLabel;

@property (weak, nonatomic) IBOutlet UILabel *interestingNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *joinNumberLabel;

@property (weak, nonatomic) IBOutlet UIImageView *activityImageView;

@property (strong, nonatomic) ActivityModel *model;

@end
