//
//  LoginViewController.m
//  LessonDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "RegisterViewController.h"

@interface LoginViewController ()


@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)loginAction:(id)sender {
    
    // 登录
    [self login];
    
    
}

- (void)login {
    
    __weak LoginViewController *loginVC = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if ([alert.message isEqualToString:@"登陆成功"]) {
            [loginVC dismissViewControllerAnimated:YES completion:nil];
            
        }
    }];
    [alert addAction:action];

    if ([self.userNameTextField.text length] <= 0){
        
        alert.message = @"用户名不能为空";
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if ([self.passwordTextField.text length] <= 0) {
        
        alert.message = @"密码不能为空";
        [self presentViewController:alert animated:YES completion:nil];
        
    }else {
        
        LoginRequest *request = [[LoginRequest alloc]init];
        
        [request loginRequestWithUsername:self.userNameTextField.text password:self.passwordTextField.text success:^(NSDictionary *dic) {
            
            NSLog(@"login success = %@",dic);
            
            long code = [[dic objectForKey:@"code"] longValue];
            if (code == 1103) {
                
                NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                // 保存头像和id到本地
                [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                alert.message = @"登陆成功";
                loginVC.completion(avatar);
                
            }else {
                if (code == 1102) {
                    alert.message = @"登录用户不存在";
                    
                }else {
                    alert.message = @"登录失败";
                }
            }
            [loginVC presentViewController:alert animated:YES completion:nil];
            
            
        } failure:^(NSError *error) {
            NSLog(@"login error = %@",error);
            alert.message = @"请求失败";
            [loginVC presentViewController:alert animated:YES completion:nil];
        }];
        
    }
    
    
}


- (IBAction)registerAction:(UIButton *)sender {
    
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    RegisterViewController *registerVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
    [self presentViewController:registerVC animated:YES completion:^{
        
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
