//
//  MrHiggie.h
//  MrHiggie
//
//  Created by Carlos Butron on 08/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MrHiggie : NSObject

@property NSString *phoneName;
@property NSString *modelNumber;
@property (readonly) NSNumber *batteryLife;

- (void) decreaseBatteryLife:(NSNumber *)arg;
- (NSString *) speak:(NSString *)greeting;
- (void) reportBatteryLife;
@end