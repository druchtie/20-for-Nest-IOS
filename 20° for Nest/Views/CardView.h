//
//  CardView.h
//  20° for Nest
//
//  Created by Karsten Westra on 20/05/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CardView : UIView

IBInspectable @property (nonatomic, assign) NSInteger numberOfItems;

IBInspectable @property (nonatomic, strong) UIColor *cardBackgroundColor;
IBInspectable @property (nonatomic, strong) UIColor *scaleUnitColor;

- (void)setupScale;

@end
