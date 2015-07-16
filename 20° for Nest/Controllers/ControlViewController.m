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

#import "LoginWebViewController.h"

@interface ControlViewController ()

@end

@implementation ControlViewController {
    TemperatureStateManager *_temperatureManager;
    
    CGPoint _initialTouchPoint;
    
    CGFloat _travelledDistance;
    CGFloat _offsetDistance;
    
    BOOL hasCode;
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        hasCode = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view, typically from a nib.

    _temperatureManager = [TemperatureStateManager new];
    [_temperatureManager setTemperatureStateDelegate:self];
    
    _offsetDistance = 15.f;
    _travelledDistance = 0.f;
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
    UIGestureRecognizer *swipeUpRecognizer = [[UIGestureRecognizer alloc] init];
    [swipeUpRecognizer setDelaysTouchesEnded:NO];
    [swipeUpRecognizer setDelegate:self];
    [_cardView addGestureRecognizer:swipeUpRecognizer];
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
        [self.cardView setBackgroundColor:[UIColor colorWithHexString:@"#e25519"]];
        [self.stateLabel setText:@"HEATING"];
    }
}

#pragma mark - UIGestureRecogniser delegate
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _initialTouchPoint = [[touches anyObject] locationInView:self.view];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:self.view];
    CGFloat distanceY = movePoint.y - _initialTouchPoint.y;
   
    if ((distanceY > 0.f && _travelledDistance < 0.f) || (distanceY < 0.f && _travelledDistance > 0.f)) {
        _travelledDistance = 0.f;
    }
    _travelledDistance += distanceY;
    if (_travelledDistance > _offsetDistance) {
        [_temperatureManager stateChange:DOWN];
        _travelledDistance = 0.f;
    } else if (_travelledDistance < -_offsetDistance) {
        [_temperatureManager stateChange:UP];
        _travelledDistance = 0.f;
    }
    _initialTouchPoint = [touch locationInView:self.view];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _initialTouchPoint = CGPointZero;
    [super touchesEnded:touches withEvent:event];
}

@end
