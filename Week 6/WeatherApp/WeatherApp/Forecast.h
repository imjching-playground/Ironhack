//
//  Forecast.h
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forecast : NSObject

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, assign) float temperature;
@property (nonatomic, assign) float minimumTemperature;
@property (nonatomic, assign) float maximumTemperature;
@property (nonatomic, assign) float humidity;
@property (nonatomic, assign) float pressure;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) NSString *iconURL;
@property (nonatomic, strong) NSDate *weatherDate;
@property (nonatomic, strong) NSString *dateToPrint;

@end
