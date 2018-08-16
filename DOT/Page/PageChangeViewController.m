//
//  PageChangeViewController.m
//  AppUsingDOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "PageChangeViewController.h"
#import "DOT.h"
@interface PageChangeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation PageChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    Page *page = [[Page alloc] init];
    [page setContentPath:@"^Home^Search^ItemList^ItemDetail"];
    [page setPageIdentity:@"PageView"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [DOT startPage];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
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
