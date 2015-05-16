//
//  ViewController.m
//  OnlyAnimals
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property AnimalsModel *anotherCount;
@property NSUserDefaults *defaults;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.anotherCount = [AnimalsModel sharedModel];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    self.anotherCount.animalCount++;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:[AnimalsModel sharedModel].animalCount] forKey:@"count"];
    
    
    if ([segue.identifier isEqualToString:@"catSegue"]){
       
        DetailsViewController *detailsController = segue.destinationViewController;
        detailsController.photoAnimal = [UIImage imageNamed:@"cat.jpg"];
        detailsController.title = @"Cat";
    }
    
    if ([segue.identifier isEqualToString:@"dogSegue"]){
    
        DetailsViewController *detailsController = segue.destinationViewController;
        detailsController.photoAnimal = [UIImage imageNamed:@"dog.jpg"];
        detailsController.title = @"Dog";
    }
    
}






@end
