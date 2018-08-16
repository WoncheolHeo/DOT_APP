//
//  ViewController.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 6. 27..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "ViewController.h"
#import "DOT.h"
#import "MainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 고객사 개발자 구현부
    Referrer *refferer = [[Referrer alloc] init];
    refferer.deepLink = @"hnsmallapp://m.hnsmall.com/goods/view/13163240?channel_code=20966&utm_source=Appier_Retargeting&utm_medium=DA&utm_campaign=Dynamic&_wts=P1525333856775&_wtc=C1527053399567&_wtm=C0000006&_wtw=DA&_wtaffid=03mSf3HNecb-&_wtbffid=&_wtp=1&_wtckp=1440&_wtcid=TQZQBRiIQM2vu81NIIbaBg.kP1OAoKKBbiAjXwwqME-Ww&_wtpid=&_wtidfa=C8E2BA19-19D7-4F61-8122-23AC87A1A766&_wtgpid=C8E2BA19-19D7-4F61-8122-23AC87A1A766&_wtpst=appier&_wtufn=ALL&from=cdn&_wtrt=302Rdt&_wtfv=server&_wtno=703&_wtufn=ALL&_wtclkTime=1530839523469";
    
    refferer.referrer = @"channel_code=20966&utm_source=Appier_Retargeting&utm_medium=DA&utm_campaign=Dynamic&_wts=P1525333856775&_wtc=C1527053399567&_wtm=C0000006&_wtw=DA&_wtaffid=03mSf3HNecb-&_wtbffid=&_wtp=1&_wtckp=1440&_wtcid=TQZQBRiIQM2vu81NIIbaBg.kP1OAoKKBbiAjXwwqME-Ww&_wtpid=&_wtidfa=C8E2BA19-19D7-4F61-8122-23AC87A1A766&_wtgpid=C8E2BA19-19D7-4F61-8122-23AC87A1A766&_wtpst=appier&_wtufn=ALL&from=cdn&_wtrt=302Rdt&_wtfv=server&_wtno=703&_wtufn=ALL&_wtclkTime=1530839523469";

    
    [DOT setDeepLink:refferer.deepLink];
    [DOT setReferrer:refferer];
    //[DOT setReferrer:refferer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [DOT startPage];
}

- (IBAction)loginButtonTouched:(id)sender {
    // Session 세팅
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


- (IBAction)purchaseButtonTouched:(id)sender {
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
- (IBAction)pageSettingTouched:(id)sender {
    //page세팅
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

- (IBAction)goalSettingTouched:(id)sender {
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

- (IBAction)clickEventTouched:(id)sender {
    //click 세팅
    Click *click = [[Click alloc] init];
    
    [click setSearchClickEvent:@"iPhone"];
    CustomValue *customValue5 = [[CustomValue alloc] init];
    [customValue5 setCustomerValue1:@"myMvtvalue1"];
    [customValue5 setCustomerValue2:@"myMvtvalue2"];
    
    [click setCustomValue:customValue5];
    
    [DOT setClick:click];
}

- (IBAction)purchaseAgainButtonTouched:(id)sender {
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

@end
