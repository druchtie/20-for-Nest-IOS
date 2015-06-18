//
//  ViewController.h
//  20° for Nest
//
//  Created by Danny Ruchtie on 5/14/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

#import "TemperatureStateChangedProtocol.h"

@interface ControlViewController : UIViewController <TemperaretureStateChanged>

@property (strong, nonatomic) IBOutlet CardView *cardView;

@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UILabel *mainTemperatureLabel;
@property (strong, nonatomic) IBOutlet UILabel *subsubTemperatureLabel;

- (void)swipedUp:(UISwipeGestureRecognizer*)recognizer;
- (void)swipedDown:(UISwipeGestureRecognizer*)recognizer;

@end

