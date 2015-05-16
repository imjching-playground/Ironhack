//
//  ViewController.m
//  Converter
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "EuroConverter.h"

@interface ViewController ()

@property (nonatomic) float money;
@property NSString *test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.money = 100;
    
    self.test = nil;
    
   NSLog(@"100 euros are %f pesetas", [EuroConverter convertFromEuroToPeseta:self.money]);
   NSLog(@"100 pesetas are %d euros", [EuroConverter convertFromPesetaToEuro:self.money]);
    
    EuroConverter *converter = [[EuroConverter alloc] initWithMoney:self.money];
    
   // NSLog(@"%f pesetas are %f euros", self.money, converter.convertToEuro);
    NSLog(@"%f euros are %ld pesetas", self.money, [converter convertToPeseta]);

    NSLog(@"%f euros are %ld pesetas", self.money, converter.convertToPeseta);
    
    SEL sel = NSSelectorFromString(@"convertToPeseta");
    [converter performSelector:sel];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
