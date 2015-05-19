//
//  GeorgeViewController.m
//  ComplicatedModel
//
//  Created by Georgios Pessios on 5/14/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "GeorgeViewController.h"

@interface GeorgeViewController ()

@property(nonatomic,strong)IBOutlet UILabel *georgeIsGreat;

@end

@implementation GeorgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.georgeIsGreat.text = @"George is Great!";
    
}



@end
