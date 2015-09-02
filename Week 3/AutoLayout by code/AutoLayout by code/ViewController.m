//
//  ViewController.m
//  AutoLayout by code
//
//  Created by Carlos Butron on 03/09/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "AutolayoutHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"Screen 1";
    
    [self createViews];
    
}

-(void)createViews{
    
    UILabel *red = [[UILabel alloc]init];
    red.backgroundColor = [UIColor yellowColor];
    red.text = @"red";
    red.textColor = [UIColor whiteColor];
    red.textAlignment = NSTextAlignmentCenter;
    //  [red setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *green = [[UILabel alloc]init];
    green.backgroundColor = [UIColor orangeColor];
    green.text = @"green";
    green.textColor = [UIColor whiteColor];
    green.textAlignment = NSTextAlignmentCenter;
    //   [green setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    id top = self.topLayoutGuide;
    id bottom = self.bottomLayoutGuide;
    
    
    
    UILabel *blue = [[UILabel alloc]init];
    blue.backgroundColor = [UIColor blueColor];
    blue.text = @"blue";
    blue.textColor = [UIColor whiteColor];
    blue.textAlignment = NSTextAlignmentCenter;
    //   [blue setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //   [self.black addSubview:red];
    //    [self.black addSubview:blue];
    //   [self.black addSubview:green];
    
    // NSDictionary *views = @{@"blue":blue, @"red":red, @"green":green};
    
    NSDictionary *views = NSDictionaryOfVariableBindings(red,blue,green, top, bottom);
    
    //  NSDictionary *views2 = VarBindings(green, blue); //shortcut of the helper class.
    
    [AutolayoutHelper configureView:self.view
                           subViews:views
                        constraints:@[
                                      @"H:|-[blue]-[red]-|",
                                      @"X:blue.width == red.width *0.5",
                                      @"V:[top]-[blue(==green)]-[green]-[bottom]",
                                      @"V:[top]-[red]-[green]-[bottom]",
                                      @"H:|-[green]-|"
                                      ]];
    /*
     NSArray *cs1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[blue]-[red]-|" options:0 metrics:nil views:views];
     
     NSArray *cs2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[blue(==green)]-[green]-|" options:0 metrics:nil views:views];
     
     NSArray *cs3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[red]-[green]-|" options:0 metrics:nil views:views];
     
     NSArray *cs4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[green]-|" options:0 metrics:nil views:views];
     */
    
    
    //blue.width == red.width *0.5
    
    /*   NSLayoutConstraint *c = [NSLayoutConstraint constraintWithItem:blue
     attribute:NSLayoutAttributeWidth
     relatedBy:NSLayoutRelationEqual
     toItem:red
     attribute:NSLayoutAttributeWidth
     multiplier:0.5
     constant:0];
     
     
     //   [self.black addConstraints:cs1];
     //   [self.black addConstraints:cs2];
     //   [self.black addConstraints:cs3];
     //   [self.black addConstraints:cs4];
     [self.black addConstraint:c];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
