//
//  LoginVC.m
//  firstDemo
//
//  Created by 靳建南 on 2024/6/12.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * btn =[UIButton btnWithFrame:CGRectMake(100, 100, 100, 100) title:@"按钮" titleColor:UIColor.redColor titleFont:14 backgroundColor:UIColor.greenColor];
    [self.view addSubview:btn];
    
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
