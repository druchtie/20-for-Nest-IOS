//
//  TemperatureManager.m
//  20° for Nest
//
//  Created by Karsten Westra on 18/06/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import "TemperatureStateManager.h"

@implementation TemperatureStateManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _currentTemperature = 20.5;
        _targetTemperature = _currentTemperature;
    }
    return self;
}

#pragma mark - State change event management
- (void)stateChange:(TemperatureChangeDirection)direction {
    switch (direction) {
        case UP:
            _targetTemperature += 0.5;
            break;
        case DOWN:
            _targetTemperature -= 0.5;
            break;
    }
    [_temperatureStateDelegate stateChangedInDirection:direction
                                     targetTemperature:_targetTemperature
                                    currentTemperature:_currentTemperature];
}

@end
