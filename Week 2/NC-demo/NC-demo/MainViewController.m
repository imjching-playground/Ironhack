//
//  ViewController.m
//  NC-demo
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"
#import "DetailsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Main Screen";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//manual segue to details view

- (IBAction)actionPresent:(id)sender {
    
    DetailsViewController * detailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"DETAILS"];
    
    detailsController.text = @"Mytitle";
    
    detailsController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:detailsController
                       animated:YES
                     completion:nil];
    
}


// visual segue to details view

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"DetailsSegue"]){
        
        DetailsViewController* detailsController = segue.destinationViewController;
        
        detailsController.text = @"Carlos";
        
        
    }
    
}


@end
