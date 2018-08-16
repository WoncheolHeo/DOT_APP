//
//  LoginViewController.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 24..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "DOT.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UILabel *loginFinishLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [DOT startPage];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    
    [indicator startAnimating];
    
    Page *page = [[Page alloc] init];
    [page setPageIdentity:@"LIR"];
    
    [DOT setPage:page];
    
    User *user = [[User alloc] init];
    
    [user setMember:@"Y"];
    [user setGender:@"M"];
    [user setAge:@"C"];
    [user setMemberGrade:@"VIP"];
    [user setAttribute1:@"attr1"];
    [user setAttribute2:@"attr2"];
    [user setAttribute3:@"attr3"];
    [user setAttribute4:@"attr4"];
    [user setAttribute5:@"attr5"];
    [user setIsLogin:@"Y"];
    
    [DOT setUser:user];
    [indicator performSelector:@selector(stopAnimating) withObject:nil afterDelay:1.5];
    self.loginFinishLabel.text = @"로그인이 완료되었습니다.";
}

- (IBAction)mainViewTouched:(id)sender {
    MainViewController *mvc = [[MainViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
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
