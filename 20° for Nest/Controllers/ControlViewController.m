//
//  ViewController.m
//  20° for Nest
//
//  Created by Danny Ruchtie on 5/14/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import "ControlViewController.h"

#import "TemperatureStateManager.h"

#import "UIColor+Expanded.h"

@interface ControlViewController ()

@end

@implementation ControlViewController {
    TemperatureStateManager *_temperatureManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view, typically from a nib.

    _temperatureManager = [TemperatureStateManager new];
    [_temperatureManager setTemperatureStateDelegate:self];
    [self setupSwipeGestures:_temperatureManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - statusbar style management
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - swipe management
- (void)setupSwipeGestures:(TemperatureStateManager *)manager {
    UISwipeGestureRecognizer *swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedUp:)];
    swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUpRecognizer];
    
    UISwipeGestureRecognizer *swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedDown:)];
    swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDownRecognizer];
}

- (void)stateChangedInDirection:(TemperatureChangeDirection)direction
              targetTemperature:(CGFloat)targetTemperature
             currentTemperature:(CGFloat)currentTemperature {
    
    NSString *temp = [NSString stringWithFormat:@"%d", (int)targetTemperature];
    [self.mainTemperatureLabel setText:temp];

    NSString *subTemp = self.subsubTemperatureLabel.text;
    if ([subTemp isEqualToString:@"5"]) {
        [self.subsubTemperatureLabel setText:@"0"];
    } else {
        [self.subsubTemperatureLabel setText:@"5"];
    }
    
    if (targetTemperature < currentTemperature) {
        // TODO: handle can cool and make blue
        [self.cardView setBackgroundColor:[UIColor colorWithHexString:@"#050505"]];
        [self.stateLabel setText:@"NORMAL"];
    } else {
        [self.cardView setBackgroundColor:[UIColor colorWithHexString:@"#E63117"]];
        [self.stateLabel setText:@"HEATING"];
    }
}

- (void)swipedUp:(UISwipeGestureRecognizer*)recognizer {
    [_temperatureManager stateChange:UP];
}

- (void)swipedDown:(UISwipeGestureRecognizer*)recognizer {
    [_temperatureManager stateChange:DOWN];
}

@end
