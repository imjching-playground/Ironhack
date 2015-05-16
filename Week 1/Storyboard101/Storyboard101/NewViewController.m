//
//  NewViewController.m
//  Storyboard101
//
//  Created by Carlos Butron on 06/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) UILabel *lblMain;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblMain = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 44)];
    self.lblMain.text = @"Hello, I come from a code";
    self.lblMain.textColor = [UIColor greenColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
