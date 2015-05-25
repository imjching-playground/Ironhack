//
//  ViewController.m
//  HomerAnimation
//
//  Created by Carlos Butron on 20/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photoMainImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoMainImageView.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
//    [UIView animateWithDuration:2.0 animations:^ {
//        self.photoMainImageView.alpha = 0.2;
//    }completion:^(BOOL finished){
//        NSLog(@"COMPLETED!");
//        [self animatedStep2];
//    }];
    
    //animation with delay
//    [UIView animateWithDuration:2.0
//                          delay:0.5
//                        options:UIViewAnimationOptionCurveEaseOut
//                     animations:^{
//                         self.photoMainImageView.center = CGPointMake(200, 300);
//                     }
//                     completion:^(BOOL finished) {
//                         
//                     }];
    
    [UIView animateWithDuration:5.0
                          delay:1.0
         usingSpringWithDamping:0.05
          initialSpringVelocity:0.0
                        options:0
                     animations:^{
                         self.photoMainImageView.center = CGPointMake(200, 300);
                     } completion:nil];


}


- (void)animatedStep2 {
    
        [UIView animateWithDuration:2.0
                         animations:^{
                             self.photoMainImageView.transform = CGAffineTransformMakeRotation(M_PI);
                             self.photoMainImageView.alpha = 0.6;
                             self.photoMainImageView.center = CGPointMake(200, 200);
                             self.photoMainImageView.backgroundColor = [UIColor greenColor];
                             self.photoMainImageView.transform = CGAffineTransformMakeScale(2, 2);

                         }completion:^(BOOL finished){
                             NSLog(@"COMPLETED!");
                             [self animatedStep3];
                         }];

    
}


- (void)animatedStep3 {
    
    [UIView animateWithDuration:2.0
                     animations:^{
                         self.photoMainImageView.transform = CGAffineTransformMakeRotation(M_PI);
                         self.photoMainImageView.alpha = 0.6;
                         self.photoMainImageView.center = CGPointMake(100, 400);
                         self.photoMainImageView.backgroundColor = [UIColor greenColor];
                         
                     }];
    
    
}

@end
