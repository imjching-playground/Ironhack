//
//  DeviceHardwareHelper.m
//  cameraCafé
//
//  Created by Leo Font on 11/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "DeviceHardwareHelper.h"
#import <UIKit/UIKit.h>

@import CoreMotion;
@import AudioToolbox;
@import AVFoundation;

typedef void(^SIMPLE_BLOCK)();

@interface DeviceHardwareHelper()

@property (nonatomic, strong) SIMPLE_BLOCK enterBlock;
@property (nonatomic, strong) SIMPLE_BLOCK leaveBlock;


@property (strong, nonatomic) CMMotionManager *motionManager;

@end

@implementation DeviceHardwareHelper

- (instancetype)init
{
    
    self = [super init];
    if (self) {
     
        [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(proximityStateChanged) name:UIDeviceProximityStateDidChangeNotification object:nil];
       
         [self setupGyroAcc];
    }
    
    return self;
    
}

-(void)setupGyroAcc {
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    
    if (self.motionManager.accelerometerAvailable) {
        
        self.motionManager.accelerometerUpdateInterval = 1.0 ;
        
    }
    if (self.motionManager.gyroAvailable) {
        
        self.motionManager.gyroUpdateInterval = 1.0 ;
        
    }
    
    [self.motionManager
     startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
     withHandler:^(CMAccelerometerData *accelerometerData, NSError *error){
         
         NSLog(@"Accel x axis = %f",accelerometerData.acceleration.x);
         NSLog(@"Accel y axis = %f",accelerometerData.acceleration.y);

     }];
    
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        
        NSLog(@"gyroData.rotationRate x %f",gyroData.rotationRate.x);
        NSLog(@"gyroData.rotationRate y %f",gyroData.rotationRate.y);
        NSLog(@"gyroData.rotationRate z %f",gyroData.rotationRate.z);
        
    
    }];
    
    
   

    
    
    
    
}













- (void)onProximityEventApproachDoThis:(SIMPLE_BLOCK)action {
    
  self.enterBlock = action;

}

- (void)onProximityEventLeavingDoThis:(SIMPLE_BLOCK)action{
    
    self.leaveBlock = action;
  
}

- (void)proximityStateChanged {
    
    if ([[UIDevice currentDevice] proximityState] == YES) {
        
        // close to the user
        // launch on approaching block
        
        self.enterBlock();
    } else {
        // launch on leaving block
        
        self.leaveBlock();
    }
    
}





+(void)vibrate {
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
}







+ (void)torchOn {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOn];
    [device unlockForConfiguration];
    
}
+ (void)torchOff {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOff];
    [device unlockForConfiguration];
}

+ (NSString *)batteryLevel{
    
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;

    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    
    if (batteryLevel < 0.0) {
        // -1.0 means battery state is UIDeviceBatteryStateUnknown
        NSLog(@" Nivel batería desconocido");
        
        
    }else {
        
        static NSNumberFormatter *numberFormatter = nil;
        
        if (numberFormatter == nil) {

         numberFormatter = [[NSNumberFormatter alloc] init];
         [numberFormatter setNumberStyle:NSNumberFormatterPercentStyle];
         [numberFormatter setMaximumFractionDigits:1];
        }
        
         NSNumber *levelObj = [NSNumber numberWithFloat:batteryLevel];
        [UIDevice currentDevice].batteryMonitoringEnabled = NO;

        return [numberFormatter stringFromNumber:levelObj];
    
    }

    [UIDevice currentDevice].batteryMonitoringEnabled = NO;

    
   return @"Unknown";
}



@end
