//
//  SearchViewController.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 25..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "SearchViewController.h"
#import "DOT.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

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
    
    Page *page = [[Page alloc] init];
    
    [page setKeyword:@"청바지"];
    [page setKeywordCategory:@"통합검색"];
    [page setSearchingResult:100];
    
    [DOT setPage:page];
}

- (IBAction)searchKeywordTouched:(id)sender {
    Click *click = [[Click alloc] init];
    
    [click setSearchClickEvent:@"청바지"];
    
    CustomValue *customValue = [[CustomValue alloc] init];
    [customValue setCustomerValue1:@"mvt1"];
    
    [click setCustomValue:customValue];
    
    [DOT setClick:click];
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
