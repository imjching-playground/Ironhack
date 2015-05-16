//
//  ModalViewController.m
//  TestPicker
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()



@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//one way to back
//- (IBAction)prepareForUnwind:(UIStoryboardSegue *) sender{
//    
//    
//}


- (IBAction)didTapExitButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        //do something with saving or whatever
        
        //everything that goes here will get executed after the viewcontroller disappears
    }];
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
