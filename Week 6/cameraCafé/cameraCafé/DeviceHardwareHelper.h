//
//  DeviceHardwareHelper.h
//  cameraCafé
//
//  Created by Leo Font on 11/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceHardwareHelper : NSObject

+(void)vibrate;
+ (void)torchOn;
+ (void)torchOff;
+(NSString *)batteryLevel;


-(void)setupGyroAcc;

- (void)onProximityEventApproachDoThis:(void(^)())action;

- (void)onProximityEventLeavingDoThis:(void(^)())action;


@end
