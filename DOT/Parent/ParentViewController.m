//
//  ParentViewController.m
//  AppUsingDOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "DOT.h"
#import "ParentViewController.h"
#import "JsonShowView.h"
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
@interface ParentViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (SYSTEM_VERSION_LESS_THAN(@"11.0")) {
        _topLayoutConstraint.constant = -20;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)backButtonTouched:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)showJsonButtonTouched:(id)sender {
    UIView *windowView = [[UIApplication sharedApplication] keyWindow];
    JsonShowView *jsonShowView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JsonShowView class]) owner:nil options:nil] firstObject];
    
    jsonShowView.frame = windowView.bounds;
    
    NSString *jsonString = [[NSUserDefaults standardUserDefaults] stringForKey:@"sendedJsonList"];
    jsonShowView.jsonStringLabel.text =  jsonString;
    if (SYSTEM_VERSION_LESS_THAN(@"11.0")) {
          jsonShowView.topLayoutConstraint.constant = -20;
    }
  
    [windowView addSubview:jsonShowView];
//    JsonShowViewController *jsvc = [[JsonShowViewController alloc] init];
//    [self presentViewController:jsvc animated:YES completion:nil];
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
