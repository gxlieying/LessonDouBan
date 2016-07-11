//
//  RegisterRequest.m
//  LessonDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest

- (void)registerWithName:(NSString *)name password:(NSString *)password avatar:(UIImage *)image success:(SuccessResponse)success failure:(FailureResponse)failure {
    
    NSDictionary *parameter = @{@"userName":name,@"password":password};
    NetworkRequest *request = [[NetworkRequest alloc] init];
    [request sendImageWithUrl:RegisterRequest_Url parameter:parameter image:image successResponse:^(NSDictionary *dic) {
        success(dic);
        
        
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}


@end
