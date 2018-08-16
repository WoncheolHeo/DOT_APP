//
//  ItemDetailViewController.h
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "ParentViewController.h"

@interface ItemDetailViewController : ParentViewController

@property (nonatomic) NSString *productCode;
@property (nonatomic) NSInteger productIndex;
@property (nonatomic) UIImage *productImage;
@end
