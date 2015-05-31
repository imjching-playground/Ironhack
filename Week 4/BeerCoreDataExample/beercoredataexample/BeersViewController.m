//
//  BeersViewController.m
//  BeerCoreDataExample
//
//  Created by Georgios Pessios on 5/28/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "BeersViewController.h"
#import "CoreDataEntitiesManager.h"
#import "CountryEntity.h"
#import "BeerEntity.h"

@interface BeersViewController ()

@property (nonatomic, strong)CoreDataEntitiesManager *manager;

@end

@implementation BeersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [CoreDataEntitiesManager sharedEntitiesManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
