//
//  TemperatureStateChangedProtocol.h
//  20° for Nest
//
//  Created by Karsten Westra on 18/06/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

typedef enum {
    UP = 0,
    DOWN = 1
} TemperatureChangeDirection;

@protocol TemperaretureStateChanged <NSObject>

- (void)stateChangedInDirection:(TemperatureChangeDirection)direction targetTemperature:(CGFloat)targetTemperature currentTemperature:(CGFloat)currentTemperature;

@end
