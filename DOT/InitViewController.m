//
//  InitViewController.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 24..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "InitViewController.h"
#import "MainViewController.h"
#import "LoginViewController.h"
@interface InitViewController ()

@end

@implementation InitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginViewTouched:(id)sender {
    LoginViewController *lvc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:lvc animated:YES];
}


- (IBAction)mainViewButtonTouched:(id)sender {
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
