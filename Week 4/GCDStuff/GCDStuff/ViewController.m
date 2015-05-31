//
//  ViewController.m
//  GCDStuff
//
//  Created by Marc on 29/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *randomNumberLabel;
@property NSInteger randomNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionWork2Seconds:(id)sender {
    // Keeps the processor busy for 2 seconds
    // Simulate a long-running task like downloading image from network
    sleep(2);
}

- (IBAction)actionDispatch2Seconds:(id)sender {
    // Sleep for 2 seconds in a background queue
    
    // Ask the system for the background queue id
    dispatch_queue_t dispatch_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    // Send the work to the background queue
    dispatch_async(dispatch_queue, ^{
        // The background thread will be busy for 2 seconds
        sleep(2);
    });
    
}

- (IBAction)actionAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (IBAction)actionLoadImageMainThread:(id)sender {
    NSString *imageString = @"http://upload.wikimedia.org/wikipedia/commons/b/bf/GOES-13_First_Image_jun_22_2006_1730Z.jpg";
    
    NSURL *imageURL = [NSURL URLWithString:imageString];
    // Getting the data from the URL in the main thread
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    // Creating image from the downloaded data
    UIImage *image = [UIImage imageWithData:data];
    self.imageView.image = image;
}

- (IBAction)actionLoadImageBackground:(id)sender {
    NSString *imageString = @"http://upload.wikimedia.org/wikipedia/commons/5/5b/Ultraviolet_image_of_the_Cygnus_Loop_Nebula_crop.jpg";
    
    // Ask the system for the background queue id
    dispatch_queue_t dispatch_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    // Send the work to the background queue
    dispatch_async(dispatch_queue, ^{
        NSURL *imageURL = [NSURL URLWithString:imageString];
        NSLog(@"Going to load the data");
        // Getting the data from the URL in the main thread
        NSData *data = [NSData dataWithContentsOfURL:imageURL];
        // Creating image from the downloaded data
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"Finished loading the data");
        
        // Run a block on the main thread when possible
        // Waits until there's nothing running on the main thread
        // dispatch_get_main_queue() is what defines the block to be on the main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            // We are accessing UI code, this needs to run on the main thread
            self.imageView.image = image;
        });
    });
}

- (IBAction)actionCreateRandomNumber:(id)sender {
    // Dispatch once works with a system variable to ensure that only runs once
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        self.randomNumber = arc4random();
    });
    
    self.randomNumberLabel.text = [NSString stringWithFormat:@"%ld",(long)self.randomNumber];
}

@end
