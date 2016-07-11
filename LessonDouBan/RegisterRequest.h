//
//  RegisterRequest.h
//  LessonDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject

- (void)registerWithName:(NSString *)name password:(NSString *)password avatar:(UIImage *)image success:(SuccessResponse)success failure:(FailureResponse)failure;


@end
