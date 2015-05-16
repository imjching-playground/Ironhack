//
//  Light.m
//  TrafficLight
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Light.h"

@interface Light()

@property (nonatomic, strong) NSArray *duration;

@end

@implementation Light



- (instancetype) initWithDuration:(NSArray *)myDuration{
    
    self = [super init];
    
    if (self) {
        
       // self.duration = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TrafficLight" ofType:@"plist"]];
        //self.duration = [NSArray array]
        self.duration = myDuration;
        
        NSLog(@"%@", self.duration);
        
    }
   
    return self;
    
}



- (double)durationForLightIndex: (int)index{
    
    NSNumber *duration = self.duration[index];
    return duration.doubleValue;
}

@end
