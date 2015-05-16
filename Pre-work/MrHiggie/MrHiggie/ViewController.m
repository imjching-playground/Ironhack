//
//  ViewController.m
//  MrHiggie
//
//  Created by Carlos Butron on 08/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "MrHiggie.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MrHiggie *talkingiPhone = [[MrHiggie alloc] init];
    talkingiPhone.phoneName = @"Mr. Higgie";

    

    
    [talkingiPhone decreaseBatteryLife:@5];
    [talkingiPhone reportBatteryLife];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
