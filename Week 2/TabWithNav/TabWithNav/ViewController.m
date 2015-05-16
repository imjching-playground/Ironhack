//
//  ViewController.m
//  TabWithNav
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

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
- (IBAction)fourButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    [(UINavigationController *)self.presentingViewController popToRootViewControllerAnimated:YES];
    
    
}
- (IBAction)changeTabBar:(id)sender {
    
    if (self.tabBarController.selectedIndex == 0){
        
        self.tabBarController.selectedIndex = 1;
        
    } else{
    
    self.tabBarController.selectedIndex = 0;
    }
}

@end
