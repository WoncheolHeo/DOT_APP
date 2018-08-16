//
//  MainViewController.m
//  AppUsingDOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "MainViewController.h"
#import "DOT.h"
#import "CommonTableViewCell.h"
#import "PageChangeViewController.h"
#import "ItemDetailViewController.h"
#import "LoginViewController.h"
#import "SearchViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *productList;
@property (nonatomic) NSArray *productImageList;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CommonTableViewCell" bundle:nil]
         forCellReuseIdentifier:kCommonTableViewCellIdentifier];
   
    self.productList = [[NSArray alloc] init];
    self.productList = @[@"PROD001", @"PROD002", @"PROD003", @"PROD004", @"PROD005", @"PROD006", @"PROD007", @"PROD008", @"PROD009", @"PROD0010", @"PROD0011", @"PROD0012" ];
    self.productImageList = @[@"iphoneX", @"PS4", @"lgtv", @"air", @"tag", @"audi", @"bmw", @"landrober", @"macbook", @"note9", @"ipad", @"nintendo" ];
    
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
    [page setPageIdentity:@"MAIN"];
    
    [DOT setPage:page];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCommonTableViewCellIdentifier];
    
    cell.titleLabel.text = [self.productList objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ItemDetailViewController *idvc = [[ItemDetailViewController alloc] init];
    idvc.productCode = [self.productList objectAtIndex:indexPath.row];
    idvc.productIndex = indexPath.row + 1;
    
    idvc.productImage = [UIImage imageNamed:[self.productImageList objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:idvc animated:YES];
}

- (void)setLogin {
    User *user = [[User alloc] init];
    
    [user setMember:@"Y"];
    [user setGender:@"M"];
    [user setAge:@"35"];
    [user setMemberGrade:@"VIP"];
    [user setAttribute1:@"Seoul"];
    [user setAttribute2:@"sports"];
    [user setAttribute3:@"married"];
    [user setIsLogin:@"Y"];
    
    [DOT setUser:user];
    [DOT sendTransaction];
}

- (void)setPage {
    Page *page = [[Page alloc] init];
    [page setContentPath:@"^Home^Search^ItemList^ItemDetail"];
    [page setPageIdentity:@"MainView"];
    NSInteger searchingResult = 0;
    [page setSearchingResult:searchingResult];
    
    CustomValue *customValue4 = [[CustomValue alloc] init];
    [customValue4 setCustomerValue1:@"myMvtvalue1"];
    [customValue4 setCustomerValue2:@"myMvtvalue2"];
    
    Product *product4 = [[Product alloc] init];
    [product4 setFirstCategory:@"Computer"];
    [product4 setSecondCategory:@"NoteBook"];
    [product4 setThirdCategory:@"MacBook"];
    [product4 setDetailCategory:@"MacBookPro"];
    [product4 setProductCode:@"item20180034234"];
    [product4 setAttribute1:@"productAttribute1"];
    [product4 setProductOrderNo:@"2018item34234352"];
    [product4 setOrderAmount:10000.0];
    
    [page setCustomValueSet:customValue4];
    [page setProduct:product4];
    
    [DOT setPage:page];
}

- (void)setConversion {
    //Conversion세팅
    Conversion *conversion = [[Conversion alloc] init];
    
    [conversion setMicroConversion:@"g1" value:1.0];
    [conversion setMicroConversion:@"g2" value:10000.0];
    
    CustomValue *customValue3 = [[CustomValue alloc] init];
    [customValue3 setCustomerValue1:@"myMvtvalue1"];
    [customValue3 setCustomerValue2:@"myMvtvalue2"];
    
    Product *product3 = [[Product alloc] init];
    [product3 setFirstCategory:@"Computer"];
    [product3 setSecondCategory:@"NoteBook"];
    [product3 setThirdCategory:@"MacBook"];
    [product3 setDetailCategory:@"MacBookPro"];
    [product3 setProductCode:@"item20180034234"];
    [product3 setAttribute1:@"productAttribute1"];
    [product3 setProductOrderNo:@"2018item34234352"];
    [product3 setOrderAmount:10000.0];
    
    [conversion setCustomValueSet:customValue3];
    [conversion setProduct:product3];
    
    [conversion setPushAgreement:YES];
    
    [DOT setConversion:conversion];
}

- (void)setClick {
    //click 세팅
    Click *click = [[Click alloc] init];
    
    [click setSearchClickEvent:@"iPhone"];
    CustomValue *customValue5 = [[CustomValue alloc] init];
    [customValue5 setCustomerValue1:@"myMvtvalue1"];
    [customValue5 setCustomerValue2:@"myMvtvalue2"];
    
    [click setCustomValue:customValue5];
    
    [DOT setClick:click];
}


- (void)chagePage {
    PageChangeViewController *pcvc = [[PageChangeViewController alloc] init];
    [self.navigationController pushViewController:pcvc animated:YES];
}

- (void)orderItemA {
    //REVENUE 세팅
    Purchase *purchase = [[Purchase alloc] init];
    [purchase setKeywordCategory:@"MacBook"];
    [purchase setKeyword:@"MacBookPro"];
    [purchase setOrderNo:@"201807020000004"];
    
    CustomValue *customValue1 = [[CustomValue alloc] init];
    [customValue1 setCustomerValue1:@"myMvtvalue1"];
    [customValue1 setCustomerValue2:@"myMvtvalue2"];
    
    Product *product1 = [[Product alloc] init];
    [product1 setFirstCategory:@"Computer"];
    [product1 setSecondCategory:@"NoteBook"];
    [product1 setThirdCategory:@"MacBook"];
    [product1 setDetailCategory:@"MacBookPro"];
    [product1 setProductCode:@"item20180034234"];
    [product1 setAttribute1:@"productAttribute1"];
    [product1 setProductOrderNo:@"2018item34234352"];
    [product1 setOrderAmount:10000.0];
    [product1 setRefundAmount:100.0];
    
    Product *product2 = [[Product alloc] init];
    [product2 setFirstCategory:@"CellularPhone"];
    [product2 setSecondCategory:@"SmartPhone"];
    [product2 setThirdCategory:@"iPhone"];
    [product2 setDetailCategory:@"iPhoneX"];
    [product2 setProductCode:@"item201800343242"];
    [product2 setAttribute1:@"productAttribute1"];
    [product2 setAttribute2:@"productAttribute2"];
    [product2 setProductOrderNo:@"2017item34234352"];
    [product2 setOrderAmount:20000.0];
    
    //    [purchase setOrderProduct:product1];
    NSMutableArray *productList = [[NSMutableArray alloc] init];
    [productList addObject:product1];
    [productList addObject:product2];
    [purchase setOrderProductList:productList];
    [purchase setCustomValueSet:customValue1];
    
    [DOT setPurchase:purchase];
}

- (void)orderItemB {
    Purchase *purchase = [[Purchase alloc] init];
    [purchase setKeywordCategory:@"GALAXY 8"];
    [purchase setKeyword:@"SAMSUNG Smart Phone"];
    [purchase setOrderNo:@"201807060000001"];
    
    CustomValue *customValue1 = [[CustomValue alloc] init];
    //    [customValue1 setCustomerValue1:@"customValue1"];
    //    [customValue1 setCustomerValue2:@"customValue2"];
    
    Product *product1 = [[Product alloc] init];
    [product1 setFirstCategory:@"CellularPhone"];
    [product1 setSecondCategory:@"SmartPhone"];
    [product1 setThirdCategory:@"SAMSUNG"];
    [product1 setDetailCategory:@"GALAXY 9"];
    [product1 setProductCode:@"2018item000343"];
    [product1 setAttribute1:@"productAttribute1111"];
    [product1 setProductOrderNo:@"2018item0003431111"];
    [product1 setOrderAmount:930000.0];
    
    //    Product *product2 = [[Product alloc] init];
    //    [product2 setFirstCategory:@"CellularPhone"];
    //    [product2 setSecondCategory:@"SmartPhone"];
    //    [product2 setThirdCategory:@"GALAXY 9"];
    //    [product2 setDetailCategory:@"iPhoneX"];
    //    [product2 setProductCode:@"item201800343242"];
    //    [product2 setAttribute1:@"productAttribute1"];
    //    [product2 setAttribute2:@"productAttribute2"];
    //    [product2 setProductOrderNo:@"2017item34234352"];
    //    [product2 setOrderAmount:20000.0];
    
    [purchase setOrderProduct:product1];
    //NSMutableArray *productList = [[NSMutableArray alloc] init];
    //    [productList addObject:product1];
    //    [productList addObject:product2];
    //    [purchase setOrderProductList:productList];
    [purchase setCustomValueSet:customValue1];
    
    [DOT setPurchase:purchase];
}

- (void)moveToItemDetail {
    ItemDetailViewController *idvc = [[ItemDetailViewController alloc] init];
    [self.navigationController pushViewController:idvc animated:YES];
}

- (IBAction)loginButtonTouched:(id)sender {
    LoginViewController *lvc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:lvc animated:YES];
}

- (IBAction)searchButtonTouched:(id)sender {
    SearchViewController *svc = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}


@end
