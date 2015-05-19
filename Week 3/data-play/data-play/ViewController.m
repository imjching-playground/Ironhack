//
//  ViewController.m
//  data-play
//
//  Created by Carlos Butron on 18/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSNumber* myNumber = @100.55;
    
    double myDouble = myNumber.doubleValue;
    
    int myInt = myNumber.integerValue;
    
    NSLog(@"%i", myInt);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
