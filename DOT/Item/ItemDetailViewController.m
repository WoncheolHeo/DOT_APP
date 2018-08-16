//
//  ItemDetailViewController.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "DOT.h"
#import "ItemDetailViewController.h"
#import "ItemOrderViewController.h"
@interface ItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.productImageView.image = self.productImage;
    
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
    [page setPageIdentity:@"PDV"];

    NSString *firstCategory = [NSString stringWithFormat:@"A%d", self.productIndex];
    NSString *secondCategory = [NSString stringWithFormat:@"B%d", self.productIndex];
    NSString *thridCategory = [NSString stringWithFormat:@"C%d", self.productIndex];
    NSString *detailCategory = [NSString stringWithFormat:@"D%d", self.productIndex];
    
    Product *product = [[Product alloc] init];
    [product setFirstCategory:firstCategory];
    [product setSecondCategory:secondCategory];
    [product setThirdCategory:thridCategory];
    [product setDetailCategory:detailCategory];
    [product setProductCode:self.productCode];
    
    [page setProduct:product];
    
    
    [DOT setPage:page];
    
}
- (IBAction)orderButtonTouched:(id)sender {
    ItemOrderViewController *iovc = [[ItemOrderViewController alloc] init];
    iovc.productCode = self.productCode;
    iovc.productIndex = self.productIndex;
    
    [self.navigationController pushViewController:iovc animated:YES];
}
- (IBAction)likeButtonTouched:(id)sender {
    NSString *firstCategory = [NSString stringWithFormat:@"A%d", self.productIndex];
    NSString *secondCategory = [NSString stringWithFormat:@"B%d", self.productIndex];
    NSString *thridCategory = [NSString stringWithFormat:@"C%d", self.productIndex];
    NSString *detailCategory = [NSString stringWithFormat:@"D%d", self.productIndex];
    
    Conversion *conversion = [[Conversion alloc] init];
    [conversion setMicroConversion:@"g5" value:1];
    
    Product *product = [[Product alloc] init];
    [product setFirstCategory:firstCategory];
    [product setSecondCategory:secondCategory];
    [product setThirdCategory:thridCategory];
    [product setDetailCategory:detailCategory];
    [product setProductCode:self.productCode];
    [product setOrderAmount:10000.0];
    
    [conversion setProduct:product];
    
    CustomValue *customValue = [[CustomValue alloc] init];
    [customValue setCustomerValue1:@"mvt1"];
    
    [conversion setCustomValueSet:customValue];
    
    [DOT setConversion:conversion];
    
    [self showToastWithMessage:@"찜하기 하였습니다."];
}

- (void) showToastWithMessage:(NSString *)msg{
    NSString *message = msg;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    int duration = 1; // duration in seconds
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
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
