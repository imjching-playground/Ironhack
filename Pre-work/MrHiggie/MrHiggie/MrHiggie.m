//
//  MrHiggie.m
//  MrHiggie
//
//  Created by Carlos Butron on 08/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MrHiggie.h"

@implementation MrHiggie

- (MrHiggie *)init;
{
    _batteryLife = @100;
    return [super init];
}

- (void) decreaseBatteryLife:(NSNumber *)arg;
{
    _batteryLife = @([self.batteryLife intValue] - [arg intValue]);
}

- (void) reportBatteryLife;
{
    NSLog(@"Battery life is %@", self.batteryLife);
}

- (NSString *)speak:(NSString *)greeting;
{
    NSString *message = [NSString stringWithFormat:@"%@ says %@", self.phoneName, greeting];
    return message;
}
@end