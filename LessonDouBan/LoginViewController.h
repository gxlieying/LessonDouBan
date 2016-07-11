//
//  LoginViewController.h
//  LessonDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "BaseViewController.h"


typedef void(^CompletionBlock)(NSString *avatar);

@interface LoginViewController : BaseViewController

@property (nonatomic, copy)CompletionBlock completion;

@end
