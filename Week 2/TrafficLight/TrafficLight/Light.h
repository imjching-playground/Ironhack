//
//  Light.h
//  TrafficLight
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Light : NSObject

- (instancetype) initWithDuration:(NSArray *)myDuration;

- (double)durationForLightIndex: (int)index;

@end
