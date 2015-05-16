//
//  ViewController.m
//  Countries
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "Country.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *countriesPickerView;
@property (weak, nonatomic) IBOutlet UIButton *chowCityDataButton;
@property (strong, nonatomic) NSArray *theFinalArrayToStoryboard;


@property (nonatomic, strong) NSArray *arrayOfStuff;
@property (nonatomic, strong) NSArray *arrayOfCountries;
@property (nonatomic, strong) NSArray *arrayOfCities;



@end

@implementation ViewController

- (IBAction)showCityDataActionButton:(UIButton *)sender {
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTheArray];
    
    
    //I need to put inside the arrays the data inside in the self.theFinalArrayToStoryboard
    
    
   // [self.theFinalArrayToStoryboard objectAtIndex:arrayIndex] Country];
    
    
    
    self.arrayOfStuff = @[@"English", @"Spanish", @"German", @"English", @"French" ];
    self.arrayOfCountries = @[@"England", @"Spain", @"Germany", @"EEUU", @"France"];
    self.arrayOfCities = @[@"London", @"Madrid", @"Berlin", @"San Francisco", @"Paris"];
    // Connect data
    self.countriesPickerView.dataSource = self;
    self.countriesPickerView.delegate = self;

}


- (void)setTheArray{
    
    NSArray *theArrayOfCountriesAndCitiesAndLanguages = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photos" ofType:@"plist"]];
    
    Country *countries = [[Country alloc] init];
    
    self.theFinalArrayToStoryboard = [countries theArrayOfCountriesFromDicts:theArrayOfCountriesAndCitiesAndLanguages];
    
    
    
}





#pragma mark - UIPickersViewDataSource protocol implementation

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (component) {
        case LanguageCountryPickerColumnCountries:
            return self.arrayOfStuff.count;
            break;
        case LanguageCountryPickerColumnLanguages:
            return self.arrayOfCountries.count;
            break;
        case LanguageCountryPickerColumnCities:
            return self.arrayOfCities.count;
            break;
            
        default:
            return self.arrayOfStuff.count;
            break;
    }
    
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (component) {
        case LanguageCountryPickerColumnCountries:
            return [self.arrayOfStuff objectAtIndex:row];
            break;
        case LanguageCountryPickerColumnLanguages:
            return [self.arrayOfCountries objectAtIndex:row];
            break;
            
        case LanguageCountryPickerColumnCities:
            return [self.arrayOfCities objectAtIndex:row];
            break;
            
        default:
            return [self.arrayOfStuff objectAtIndex:row];
            break;
    }
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == LanguageCountryPickerColumnCountries){
        [pickerView selectRow:row inComponent:LanguageCountryPickerColumnCities animated:YES];
        [pickerView selectRow:row inComponent:LanguageCountryPickerColumnLanguages animated:YES];
    }
    
}




@end
