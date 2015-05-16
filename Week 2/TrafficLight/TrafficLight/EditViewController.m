//
//  EditViewController.m
//  TrafficLight
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *greenTextEdit;
@property (weak, nonatomic) IBOutlet UITextField *yellowTextEdit;
@property (weak, nonatomic) IBOutlet UITextField *redTextEdit;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.greenTextEdit setDelegate:self];
    [self.redTextEdit setDelegate:self];
    [self.yellowTextEdit setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"startTraffic"]){
        
        TrafficViewController * trafficController = segue.destinationViewController;
        
        NSNumber * greenNumber = [NSNumber numberWithDouble:self.greenTextEdit.text.doubleValue];
        NSNumber * yellowNumber = [NSNumber numberWithDouble:self.yellowTextEdit.text.doubleValue];
        NSNumber * redNumber = [NSNumber numberWithDouble:self.redTextEdit.text.doubleValue];
        
        trafficController.trafficValues = @[greenNumber, yellowNumber, redNumber];
        
         
        
        
    }
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.greenTextEdit resignFirstResponder];
    [self.redTextEdit resignFirstResponder];
    [self.yellowTextEdit resignFirstResponder];
    return YES;
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
