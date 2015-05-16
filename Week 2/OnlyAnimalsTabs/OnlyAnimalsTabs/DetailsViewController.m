//
//  DetailsViewController.m
//  OnlyAnimalsTabs
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "DetailsViewController.h"
#import "AnimalsModel.h"


//the same viewcontroller controll the both storyboards CAT and DOG
@interface DetailsViewController ()

@property AnimalsModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;
@property (weak, nonatomic) IBOutlet UILabel *animalLabel;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [AnimalsModel sharedModel]; //get singleton instance
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.model.animalCount++; //sum to my animalCount
    
    
    //if the index is tabbar 1 DOG
    if ([self.tabBarController.tabBar.items indexOfObject:self.tabBarController.tabBar.selectedItem] == 0){
        
        //set image
        NSString *dog = [[self.model animalDescription] objectAtIndex:[self.tabBarController.tabBar.items indexOfObject:self.tabBarController.tabBar.selectedItem]];
        UIImage *image = [UIImage imageNamed:dog];
        [self.animalImageView setImage:image];
        
        //set label
        self.animalLabel.text = [NSString stringWithFormat:@"%@ animals", [NSNumber numberWithInt:self.model.animalCount]];
        
        //set title
        self.title = @"Dog Inside"; //change tabbar title when we are inside this tab
        
        //save index
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:[AnimalsModel sharedModel].animalCount] forKey:@"count"];

    }
    
    //if the index is tabbar 2 CAT
    if ([self.tabBarController.tabBar.items indexOfObject:self.tabBarController.tabBar.selectedItem] == 1) {
        
        //set image
        NSString *cat = [[self.model animalDescription] objectAtIndex:[self.tabBarController.tabBar.items indexOfObject:self.tabBarController.tabBar.selectedItem]];
        UIImage *image = [UIImage imageNamed:cat];
        [self.animalImageView setImage:image];
        
        //set label
        self.animalLabel.text = [NSString stringWithFormat:@"%@ animals", [NSNumber numberWithInt:self.model.animalCount]];
        
        //set title
        self.title = @"Cat Inside"; //change tabbar title when we are inside this tab
        
        //save index
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:[AnimalsModel sharedModel].animalCount] forKey:@"count"];
        
        
 
    }
    
    //counter
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
