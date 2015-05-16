//
//  ViewController.m
//  XIBtest
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goXIB:(id)sender {
    
    NewViewController *myVC = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
    
    [self presentViewController:myVC animated:YES completion:nil];
    
}

@end
