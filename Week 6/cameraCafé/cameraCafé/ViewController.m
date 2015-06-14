//
//  ViewController.m
//  cameraCafé
//
//  Created by Leo Font on 11/3/15.
//  Copyright (c) 2015 Leo Font. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "DeviceHardwareHelper.h"
#import "SoundHelper.h"

@import AssetsLibrary;

@import ImageIO;
@import CoreImage;

@interface ViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate, SoundEffectDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (nonatomic, getter=isSaveToRollEnabled) BOOL saveToRollEnabled;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) SoundHelper* sound;
@property (weak, nonatomic) IBOutlet UILabel *batteryLevelLabel;
@property (nonatomic, strong) DeviceHardwareHelper* deviceHelper;


@end

@implementation ViewController


- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerActivities) userInfo:nil repeats:YES];
    }
    return _timer;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//
    
    self.deviceHelper = [[DeviceHardwareHelper alloc]init];
   
    self.sound = [[SoundHelper alloc]init];
    self.sound.delegate = self;
    
    [[self timer] fire];
     
    self.saveToRollEnabled = YES;
    
    
    
     [self listFonts];

    [self customFont];
    self.batteryLevelLabel.text = [DeviceHardwareHelper batteryLevel];
    
    __weak typeof(self) weakSelf = self;
    
    [self.deviceHelper onProximityEventApproachDoThis:^{
        [weakSelf.sound play:@"Norl"];

    }];
    
    [self.deviceHelper onProximityEventLeavingDoThis:^{
        [weakSelf.sound play:@"Muelas"];
    }];
    
 }


-(void)customFont {
        UIFont *customFont = [UIFont fontWithName:@"Doctor Soos Bold" size:36];
        self.batteryLevelLabel.font = customFont;

    
}



-(void)listFonts{
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  Timer



- (void)timerActivities {
    
    [DeviceHardwareHelper torchOn];
    [DeviceHardwareHelper vibrate];
    [DeviceHardwareHelper torchOff];
    [self.sound play:@"Ioputarl"];
    
}



# pragma mark Camera


- (IBAction)takePhoto:(id)sender {

    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        
        self.saveToRollEnabled = YES;
    }
}
- (IBAction)useCameraRoll:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        
        self.saveToRollEnabled = NO;

    }
}



# pragma mark Delegates

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
       
        self.photoView.image = info[UIImagePickerControllerOriginalImage];
        
        [DeviceHardwareHelper vibrate];
        
        
        if (self.isSaveToRollEnabled){
            
            UIImageWriteToSavedPhotosAlbum(self.photoView.image,
                                           self,
                                           nil,
                                           nil);
        }
        
     }
   
}


-(IBAction)zoomPhoto:(id)sender{
    
    [self zoomToFace];

    

}


-(void)zoomToFace{
    
    NSArray *features = [self featuresInImage:self.photoView.image];

    CIFeature *face = [features lastObject];
    CGRect faceBounds = [face bounds];
    
    CIImage *image = [CIImage imageWithCGImage:self.photoView.image.CGImage];
    CIImage *crop =  [image imageByCroppingToRect:faceBounds];
    
    UIImage *newImage = [UIImage imageWithCIImage:crop];
    
    self.photoView.image = newImage;

}



-(NSArray *) featuresInImage:(UIImage *)image{

    CIContext *ctxt = [CIContext contextWithOptions:nil];
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:ctxt
                                              options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    
    NSData *imgData = UIImageJPEGRepresentation(image, 1.0 );
    
    CIImage *imgFromData = [CIImage imageWithData:imgData];
    
    NSDictionary *opts = @{ CIDetectorImageOrientation :[[imgFromData properties]valueForKey:(NSString*)kCGImagePropertyOrientation] };
    
    NSArray *features = [detector featuresInImage:imgFromData
                                          options:opts];
    
    if (features){
        return features;
    }else {
        return nil;
    }
  

}
















/*
 - (void)saveButtonPressed
 {
 UIGraphicsBeginImageContext(self.imageView.image.size);
 CGRect imgRect = {CGPointZero, self.imageView.image.size};
 
 
 UIImage *topLabelImage = [self imageWithContentsOfLabel:self.topLabel];
 UIImage *bottomLabelImage = [self imageWithContentsOfLabel:self.bottomLabel];
 
 CGRect topLabelRect = CGRectMake(0, 30, CGRectGetWidth(imgRect), (CGRectGetHeight(imgRect)/10));
 CGRect bottomLabelRect = CGRectMake(0, CGRectGetHeight(imgRect) - (CGRectGetHeight(imgRect)/10), CGRectGetWidth(imgRect), (CGRectGetHeight(imgRect)/10));
 
 [self.imageView.image drawInRect:imgRect];
 [topLabelImage drawInRect:topLabelRect];
 [bottomLabelImage drawInRect:bottomLabelRect];
 
 UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 
 UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
 }
 
 
 */


#pragma delegate Calls audio

- (void)soundEffectDidFinishPlaying:(SoundHelper *)soundHelper {
    
    NSLog(@"finished playing!");
}

# pragma mark Shake

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self.sound stop];
        [self.timer invalidate];
        self.timer = nil;
    }

}





@end
