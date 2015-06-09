//
//  WeatherAPIHelper.h
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherAPIHelper : NSObject

//- (void)downloadCurrentForecast;

- (void)currentDayForecastWithCompletionBlock:(void (^)(NSData *resultData))completionBlock;
- (void)currentWeekForecastWithCompletionBlock:(void (^)(NSData *resultData))completionBlock;

@end
