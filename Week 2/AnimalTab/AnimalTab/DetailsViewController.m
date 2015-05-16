//
//  DetailsViewController.m
//  AnimalTab
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *animalPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *animalCountLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.animalPhotoImageView setImage:self.photoAnimal];
    
    AnimalsModel *count = [AnimalsModel sharedModel];
    
    self.animalCountLabel.text = [NSString stringWithFormat:@"%@ animals", [NSNumber numberWithInt:count.animalCount]];
    
}

- (IBAction)backFromDetailsToMain:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}




@end
