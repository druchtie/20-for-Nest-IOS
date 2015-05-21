//
//  CardView.m
//  20° for Nest
//
//  Created by Karsten Westra on 20/05/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import "CardView.h"



IB_DESIGNABLE
@implementation CardView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupScale];
}

- (void)setupScale {
    CGFloat total = (CGRectGetHeight(self.frame) - 22.f) / 92.f;
    
    CGFloat height = 2.f;
  
    for (int i=0; i < self.numberOfItems; ++i) {
        UIView *scaleUnit = [[UIView alloc] initWithFrame:CGRectMake(0.f, 8.f + total * i , 16.f, height)];
        [scaleUnit setBackgroundColor:self.scaleUnitColor];
        [self addSubview:scaleUnit];
        
        scaleUnit = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 16.f, 8.f + total * i , 16.f, height)];
        [scaleUnit setBackgroundColor:self.scaleUnitColor];
        [self addSubview:scaleUnit];
    }
}

@end
