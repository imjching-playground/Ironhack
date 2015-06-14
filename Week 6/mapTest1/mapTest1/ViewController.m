//
//  ViewController.m
//  Core Location Test
//
//  Created by Leo Font on 6/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "ViewController.h"

// 1 - Import

#import <CoreLocation/CoreLocation.h>


@interface ViewController ()<CLLocationManagerDelegate> //2 - Conform protocol

// 3 - Create property
@property (nonatomic, strong) CLLocationManager *locationManager;

// 4 - Link outlet

@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //5 - Startup
    
    
    self.locationManager = [[CLLocationManager alloc]init];
    
    // 6 - Check if services enables
    
     if ([CLLocationManager locationServicesEnabled]) {
         // 7 - iOS8 Ask for permission

         if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
             [self.locationManager requestWhenInUseAuthorization];
             
             // 8 - Add to plist: NSLocationWhenInUseUsageDescription
          }
             
             //9 - Start service
             self.locationManager.delegate = self;
             
             [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
           
             [self.locationManager startUpdatingLocation];
            
             if ([CLLocationManager headingAvailable]) {
                 [self.locationManager startUpdatingHeading];
             }
         
         
         
     }
 }


-(void)viewDidDisappear:(BOOL)animated{
    
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];

    
}

// 6 - Implement delegate methods
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *location = locations.lastObject;

    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
    
    self.altitudeLabel.text = [NSString stringWithFormat:@"%.01f",location.altitude];

      // Calculate distance  [location distanceFromLocation:<#(const CLLocation *)#>];
    

}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {

    self.headingLabel.text =[NSString stringWithFormat:@"%.02f",newHeading.trueHeading];
    
     self.arrowView.transform = CGAffineTransformMakeRotation(-newHeading.trueHeading * M_PI / 180);
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager {

    return YES;
}


@end
