//
//  ViewController.m
//  WeatherApp
//
//  Created by Carlos Butron on 08/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "WeatherAPIHelper.h"
#import "ForecastParser.h"
#import "Forecast.h"
#import "imageDownloader.h"

@interface ViewController ()<NSURLSessionDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UILabel *humLabel;
@property (weak, nonatomic) IBOutlet UILabel *presLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self downloadWeather];
//    [self downloadWeatherWithDelegates];
//    [self sendInformationToTheServer];
    [self downloadCurrentForecast];
    
    //reachability to check if internet works properly
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)downloadCurrentForecast {

    WeatherAPIHelper *wh = [[WeatherAPIHelper alloc] init];
    
    [wh currentDayForecastWithCompletionBlock:^(NSData *resultData) {
      
        //create a forecast parser
        ForecastParser *parser = [[ForecastParser alloc] init];
        
        //pass to it the NSData received from the WeatherAPI Helper
        Forecast *myForecast = [parser todayForecastWithData:resultData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            //update the UI
            self.cityLabel.text = [NSString stringWithFormat:@"%@", myForecast.cityName];
            self.tempLabel.text = [NSString stringWithFormat:@"%.0f", myForecast.temperature];
            self.minLabel.text = [NSString stringWithFormat:@"%.0f", myForecast.minimumTemperature];
            self.maxLabel.text = [NSString stringWithFormat:@"%.0f", myForecast.maximumTemperature];
            self.humLabel.text = [NSString stringWithFormat:@"%.0f", myForecast.humidity];
            self.presLabel.text = [NSString stringWithFormat:@"%.0f", myForecast.pressure];
            
            [imageDownloader imageWithURL:myForecast.iconURL completionBlock:^(UIImage *image) {
                
            self.imageView.image = image;
            
            }];
            
            
        });

  
     //maybe a few nice things to have: i.e.: activity indicator
     
     }];
    
}


- (void)downloadWeather {
    
    NSString * weatherURL = @"http://api.openweathermap.org/data/2.5/weather?q=Barcelona,es";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL: [NSURL URLWithString:weatherURL] completionHandler:^(NSData *serverData, NSURLResponse *response, NSError * error) {
        
        NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:serverData encoding:NSUTF8StringEncoding]);
        
        
        }]  resume];
    
}


- (void)downloadWeatherWithDelegates {
    
    NSURLSessionConfiguration *sessionConf = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConf
                                                          delegate:self
                                                     delegateQueue:nil];
    
    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Barcelona,es"];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:url];
    
    [dataTask resume];
    
}


- (void)sendInformationToTheServer {
    
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:nil];
    
    NSURL *url =[NSURL URLWithString:@"http://posttestserver.com/post.php"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString * params = @"&name=Leo&loc=Barcelona&age=43" ;
    
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest];
    
    [dataTask resume];
    
    
}


#pragma NSURLSession methods

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
     NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:data
                                                           encoding:NSUTF8StringEncoding]);
    
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    
    if (error) {
        
        NSLog(@"wrong");
        
    } else {
        
        NSLog(@"suceeded");
    }
    
}



@end
