//
//  TemperatureManager.h
//  20° for Nest
//
//  Created by Karsten Westra on 18/06/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TemperatureStateChangedProtocol.h"

@interface TemperatureStateManager : NSObject

@property (nonatomic, weak) id<TemperaretureStateChanged> temperatureStateDelegate;

@property (nonatomic, assign) CGFloat currentTemperature;
@property (nonatomic, assign) CGFloat targetTemperature;

- (void)stateChange:(TemperatureChangeDirection)direction;

@end
