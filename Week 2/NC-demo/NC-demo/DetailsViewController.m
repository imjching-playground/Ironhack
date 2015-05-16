//
//  DetailsViewController.m
//  NC-demo
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *closeButtonDetails;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
   // close.title = self.text;
    
    self.closeButtonDetails.titleLabel.text = self.text;

    
}


- (IBAction)actionClose:(id)sender {
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    //only pop stack
   // [self.navigationController popViewControllerAnimated:YES];
    
    //pop all the controllers to root
    [self.navigationController popToRootViewControllerAnimated:YES];

    //pop until we are on IUViewController that we want to go
    //    [self.navigationController popToViewController:(UIViewController *) animated:<#(BOOL)#>]
    
    
    // or go to navigation controller index
    // int count = self.navigationController.viewController.count;
    // ViewController * middleVC =
    // self.navigationController.viewControllers[count-3];
    // [self.navigationController popToViewController: middleVC animated:YES];
    //
    
    // 
    
    
}

-(IBAction)actionPresentPink:(id)sender{
    
    
    DetailsViewController * detailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"DETAILS"];
    
    detailsController.text = @"Mytitle";
    
//    detailsController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    
//    [self presentViewController:detailsController
//                       animated:YES
//                     completion:nil];
    //the same:
    
    [self.navigationController pushViewController:detailsController animated:YES];
    
    
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
