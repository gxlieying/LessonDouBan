//
//  MyTableViewCell.h
//  LessonDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MyTableViewCell_Identify @"MyTableViewCell_Identify"

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@property (weak, nonatomic) IBOutlet UILabel *subContentLabel;


@end
