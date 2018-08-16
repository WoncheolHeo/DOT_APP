//
//  JsonShowView.h
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 25..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonShowView : UIView
@property (weak, nonatomic) IBOutlet UILabel *jsonStringLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutConstraint;

@end
