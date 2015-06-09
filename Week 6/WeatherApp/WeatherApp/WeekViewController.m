//
//  WeekViewController.m
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "WeekViewController.h"
#import "WeatherAPIHelper.h"
#import "Forecast.h"
#import "ForecastParser.h"
#import "MyWeatherCell.h"
#import "imageDownloader.h"

@interface WeekViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrayOfForecast;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadCurrentForecast];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)downloadCurrentForecast {
    
    WeatherAPIHelper *wh = [[WeatherAPIHelper alloc] init];
    
    [wh currentWeekForecastWithCompletionBlock:^(NSData *resultData) {
        
        //create a forecast parser
        ForecastParser *parser = [[ForecastParser alloc] init];
        
        //pass to it the NSData received from the WeatherAPI Helper
        self.arrayOfForecast = [parser weekForecastWithData:resultData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //update the UI
            
            [self.tableView reloadData];
            
        });
        
        
        //maybe a few nice things to have: i.e.: activity indicator
        
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayOfForecast.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyWeatherCell *myCell = [tableView dequeueReusableCellWithIdentifier:@"MyWeatherCell"];
    
    Forecast *forecast = self.arrayOfForecast[indexPath.row];
    
    //myCell.labelHum.text = [NSString stringWithFormat:@"%.0f",forecast.temperature];
    myCell.labelHum.text = forecast.dateToPrint;
    myCell.labelTemp.text = [NSString stringWithFormat:@"%.0f",forecast.humidity];
    
    [imageDownloader imageWithURL:forecast.iconURL completionBlock:^(UIImage *image) {
        
        myCell.image.image = image;
        
    }];
    
    
    NSLog(@"temp: %0.f", forecast.temperature);
    NSLog(@"hum: %0.f", forecast.humidity);
    
    return myCell;
    
}




@end
