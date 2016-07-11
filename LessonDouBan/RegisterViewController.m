//
//  RegisterViewController.m
//  LessonDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 yu. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"

@interface RegisterViewController ()<UITextFieldDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;


@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.avatarImageView.userInteractionEnabled = YES;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.size.height/2.0;
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.avatarImageView.image = image;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(saveImage), nil);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated: YES completion:nil];
    
}


- (void)saveImage {
    
    NSLog(@"存储图片");
    
}

- (IBAction)tapAvatarView:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        _imagePicker.allowsEditing = YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.allowsEditing = YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:photoAction];
    [alert addAction:cameraAction];
    [alert addAction:cancelAction];
    // 显示alertController
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (IBAction)registerAction:(UIButton *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if ([alertController.message isEqualToString:@"注册成功"]) {
            // 界面消失
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:cancelAction];
    
    if (self.userNameTextField.text.length == 0) {
        alertController.message = @"用户名不能为空";
        [self presentViewController:alertController animated:YES completion:nil];
    }else if (self.passwordTextField.text.length == 0){
        alertController.message = @"密码不能为空";
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        
        RegisterRequest *request = [[RegisterRequest alloc]init];
        
        [request registerWithName:self.userNameTextField.text password:self.passwordTextField.text avatar:self.avatarImageView.image success:^(NSDictionary *dic) {
            NSLog(@"register success = %@",dic);
            
            NSString *code = [[dic objectForKey:@"code"] stringValue];
            if ([code isEqualToString:@"1005"]) {
                
                NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                // 保存头像和id到本地
                [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                alertController.message = @"注册成功";
                [self presentViewController:alertController animated:YES completion:nil];
                
                
            }else {
                if ([code isEqualToString:@"1002"]){
                    alertController.message = @"用户名已存在";
                }else {
                    alertController.message = @"注册失败";
                }
                [self presentViewController:alertController animated:YES completion:nil];
            }
            
            
        } failure:^(NSError *error) {
            NSLog(@"register error = %@",error);
            alertController.message = @"请求失败";
            [self presentViewController:alertController animated:YES completion:nil];
        }];

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
