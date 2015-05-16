//
//  ViewController.m
//  test
//
//  Created by Carlos Butron on 05/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController
- (IBAction)testButton:(id)sender {
    if ( (self.testLabel.text == nil) || (self.testLabel.text == @"") ) {
        self.testLabel.text = @"Label";
    } else {
        self.testLabel.text = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testLabel.text = nil;
    self.testLabel.text = @"Label";
    self.testLabel.text = nil;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
