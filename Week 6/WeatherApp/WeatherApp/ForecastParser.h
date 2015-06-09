//
//  ForecastParser.h
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Forecast;

@interface ForecastParser : NSObject

- (Forecast *)todayForecastWithData:(NSData *)forecastData;
- (NSMutableArray *)weekForecastWithData:(NSData *)forecastData;

@end
