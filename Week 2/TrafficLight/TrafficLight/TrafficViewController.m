//
//  ViewController.m
//  TrafficLight
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "TrafficViewController.h"
#import "Light.h"
#import "LightView.h"

@interface TrafficViewController ()


@property (nonatomic, strong) Light *light;
@property (assign, nonatomic) int currentLightIndex;
@property (nonatomic, strong) NSArray * lightColors;
@property (weak, nonatomic) IBOutlet LightView *lightView;

@end

@implementation TrafficViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
   // self.light = [[Light alloc] init];
    self.light = [[Light alloc] initWithDuration:self.trafficValues];
    self.currentLightIndex = -1;
    
    self.lightColors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor]];
    
    [self nextLight];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) nextLight
{
    
    self.currentLightIndex++;
    
    if (self.currentLightIndex ==  self.lightColors.count){
        self.currentLightIndex = 0;
    }
    

    self.lightView.backgroundColor = self.lightColors[self.currentLightIndex];
    
    double duration = [self.light durationForLightIndex:self.currentLightIndex];
    
    NSLog(@"%f", duration);
    
    [self performSelector:@selector(nextLight) withObject:nil afterDelay:duration];
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

@end
