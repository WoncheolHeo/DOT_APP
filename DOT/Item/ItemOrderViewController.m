//
//  ItemOrderViewController.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "ItemOrderViewController.h"
#import "DOT.h"
@interface ItemOrderViewController ()
@property (weak, nonatomic) IBOutlet UILabel *orderFinishLabel;

@end

@implementation ItemOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [DOT startPage];
}

- (void)viewDidAppear:(BOOL)animated {

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
 
    [indicator startAnimating];
    Purchase *purchase = [[Purchase alloc] init];
    
    Product *product = [[Product alloc] init];
    
    NSString *firstCategory = [NSString stringWithFormat:@"A%d", self.productIndex];
    NSString *secondCategory = [NSString stringWithFormat:@"B%d", self.productIndex];
    NSString *thridCategory = [NSString stringWithFormat:@"C%d", self.productIndex];
    NSString *detailCategory = [NSString stringWithFormat:@"D%d", self.productIndex];
    NSString *productOrderNo = [NSString stringWithFormat:@"ordpro00%d", self.productIndex];
    NSString *orderNo = [NSString stringWithFormat:@"ord00%d", self.productIndex];
    
    [product setFirstCategory:firstCategory];
    [product setSecondCategory:secondCategory];
    [product setThirdCategory:thridCategory];
    [product setDetailCategory:detailCategory];
    [product setProductCode:self.productCode];
    [product setOrderAmount:1];
    [product setRefundAmount:1];
    [product setProductOrderNo:productOrderNo];
    
    [purchase setOrderProduct:product];
    [purchase setOrderNo:orderNo];
    
    [DOT setPurchase:purchase];
   // [indicator stopAnimating];
    [indicator performSelector:@selector(stopAnimating) withObject:nil afterDelay:1.5];
    
    self.orderFinishLabel.text = @"주문이 완료되었습니다.";
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
