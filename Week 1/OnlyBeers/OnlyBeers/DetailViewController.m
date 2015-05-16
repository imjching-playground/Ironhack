//
//  DetailViewController.m
//  OnlyBeers
//
//  Created by Carlos Butron on 08/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *beerImageDetailStoryboard;
@property (weak, nonatomic) IBOutlet UILabel *beerNameDetailStoryboard;
@property (weak, nonatomic) IBOutlet UILabel *beerCountryDetailStoryboard;
@property (weak, nonatomic) IBOutlet UILabel *beerAlcoholDetailStoryboard;
@property (weak, nonatomic) IBOutlet UIImageView *beerFlag;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self drawBeer];  // show beer detail
    
    NSString *stringBack = @"Send back string";
    
    
    [self.delegate addItemViewController:self didFinishEnteringItem:stringBack];
    
}


// this method just show the detail beer data

- (void)drawBeer{
    
    UIImage *imageBeer = [UIImage imageNamed:[self.currentBeer beerImage]];
    [self.beerImageDetailStoryboard setImage:imageBeer];
    
    UIImage *imageFlag = [UIImage imageNamed:[self.currentCountry flag]];
    [self.beerFlag setImage:imageFlag];
    
    
    self.beerNameDetailStoryboard.text = [self.currentBeer beerName];
    self.beerCountryDetailStoryboard.text = [self.currentCountry name];
    self.beerAlcoholDetailStoryboard.text = [[[self.currentBeer beerAlcohol] stringValue] stringByAppendingString:@" ºC"];

    
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
