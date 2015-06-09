//
//  ForecastParser.m
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ForecastParser.h"
#import "Forecast.h"

@implementation ForecastParser

- (Forecast *)todayForecastWithData:(NSData *)forecastData {
    
    
    NSError *error;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:forecastData options:kNilOptions error:&error];
    
    NSArray *list = [NSArray arrayWithArray:[json valueForKey:@"list"]];
    

    
   // NSLog(@"json %@", json);
    
    Forecast *myForecast = [[Forecast alloc] init];
    
    myForecast.cityName = [[list valueForKey:@"name"] firstObject];
    
    myForecast.temperature = [[[[list valueForKey:@"main"]valueForKey:@"temp"]firstObject] floatValue];
    myForecast.minimumTemperature = [[[[list valueForKey:@"main"]valueForKey:@"temp_min"]firstObject] floatValue];
    myForecast.maximumTemperature = [[[[list valueForKey:@"main"]valueForKey:@"temp_max"]firstObject] floatValue];
    myForecast.humidity = [[[[list valueForKey:@"main"]valueForKey:@"humidity"]firstObject] floatValue];
    myForecast.pressure = [[[[list valueForKey:@"main"]valueForKey:@"pressure"]firstObject] floatValue];
    myForecast.weatherDescription = [[[list valueForKey:@"weather"]valueForKey:@"description"]firstObject];
    
    NSString *iconSuffix = [[[[list valueForKey:@"weather"] firstObject]valueForKey:@"icon"] firstObject];
    NSString *iconURL = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", iconSuffix];
    
    myForecast.iconURL = iconURL;
    
    
    
    return myForecast;
    
    
}



- (NSMutableArray *)weekForecastWithData:(NSData *)forecastData {
    
 
    NSError *error;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:forecastData options:kNilOptions error:&error];
    
    NSDictionary *list = json;
    
    NSMutableArray *weatherList = [[NSMutableArray alloc] init];
    
    //DATE
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, dd/MM/yyyy"];
    
    
    NSLog(@"city %@", [[list valueForKey:@"city"] valueForKey:@"name"]);

    for (NSDictionary *each in [list valueForKey:@"list"]) {
        
        NSLog(@"%@", each[@"clouds"]);
        Forecast *forecast = [[Forecast alloc] init];
        
        //DATE
        NSTimeInterval timestamp = [[each valueForKey:@"dt"] integerValue];
        NSDate *date =[[NSDate alloc] init];
        date = [NSDate dateWithTimeIntervalSince1970:timestamp];
        forecast.weatherDate = date;
        forecast.dateToPrint = [formatter stringFromDate:date];
        
        NSLog(@"DATE:%@", forecast.dateToPrint);
        
        forecast.cityName = [[list valueForKey:@"city"] valueForKey:@"name"];
        
        forecast.temperature = [[each[@"temp"] valueForKey:@"day"] floatValue];
        forecast.minimumTemperature = [[each[@"temp"] valueForKey:@"min"] floatValue];
        forecast.maximumTemperature = [[each[@"temp"] valueForKey:@"max"] floatValue];
        forecast.humidity = [each[@"humidity"] floatValue];
        forecast.pressure = [each[@"pressure"] floatValue];
        forecast.weatherDescription = each[@"clouds"];
        
        NSString *iconSuffix = [[each[@"weather"] valueForKey:@"icon"] firstObject];
        NSString *iconURL = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", iconSuffix];
        
       // NSLog(@"%@", iconSuffix);
        
        forecast.iconURL = iconURL;
        
        
        [weatherList addObject:forecast];
        
    }
    
  //  NSLog(@"json %@", list);
    
    

    
    return weatherList;
    
    
}


@end
