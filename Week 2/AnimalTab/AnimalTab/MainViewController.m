//
//  ViewController.m
//  AnimalTab
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property AnimalsModel *model;
@property NSUserDefaults *defaults;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [AnimalsModel sharedModel];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    self.model.animalCount++;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:[AnimalsModel sharedModel].animalCount] forKey:@"count"];
    
    
    if ([segue.identifier isEqualToString:@"catModally"]){
        
        UINavigationController *detailsController = segue.destinationViewController;
        
        DetailsViewController *details = (DetailsViewController *)detailsController.topViewController;
        details.photoAnimal = [UIImage imageNamed:@"cat.jpg"];
    }
    
    if ([segue.identifier isEqualToString:@"dogModally"]){
        
        UINavigationController *detailsController = segue.destinationViewController;
        
        DetailsViewController *details = (DetailsViewController *)detailsController.topViewController;
        details.photoAnimal = [UIImage imageNamed:@"dog.jpg"];

    }
    
}

@end
