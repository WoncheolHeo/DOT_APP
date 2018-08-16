//
//  JsonShowView.m
//  DOT
//
//  Created by Woncheol Heo on 2018. 7. 25..
//  Copyright © 2018년 wisetracker. All rights reserved.
//

#import "JsonShowView.h"

@implementation JsonShowView
- (IBAction)closeButtonTouched:(id)sender {
    //dispatch_main_sync_safe(^{
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    //});
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
