//
//  CommonTableViewCell.h
//  AppUsingDOT
//
//  Created by Woncheol Heo on 2018. 7. 23..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCommonTableViewCellIdentifier @"CommonTableViewCell"

@interface CommonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
