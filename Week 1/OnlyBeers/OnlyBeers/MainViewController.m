//
//  ViewController.m
//  OnlyBeers
//
//  Created by Carlos Butron on 08/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"
#import "Beer.h"
#import "Country.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *beerImageViewStoryboard;
@property (weak, nonatomic) IBOutlet UILabel *beerCountryLabel;
@property (strong, nonatomic) NSArray *arrayOfBeers;
@property (strong, nonatomic) NSArray *arrayOfCountries;
@property (weak, nonatomic) IBOutlet UIButton *previousButtonProperty;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonProperty;
@property (weak, nonatomic) IBOutlet UIButton *showBeerDetailButton;
@property (nonatomic, strong) NSString *thePath;
@property NSUserDefaults *defaults;

@property NSInteger index;

@end

@implementation MainViewController


// go to the next beer in the array
- (IBAction)nextBeerButton:(UIButton *)sender {
    [self validateIndexOfArray:++self.index];
    [self printThePhotoAndNameOfaBeer:self.index];
    [self saveSettings];
}

//go to the previous beer in the array
- (IBAction)previousBeerButton:(UIButton *)sender {
    [self validateIndexOfArray:--self.index];
    [self printThePhotoAndNameOfaBeer:self.index];
    [self saveSettings];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    self.index = [[[NSUserDefaults standardUserDefaults] objectForKey:@"currentIndex"] integerValue];

    // configure the basic to start
    self.showBeerDetailButton.layer.cornerRadius = 8;
    [self.previousButtonProperty setEnabled:NO];
    [self.previousButtonProperty setAlpha:0.4];
    
    [self setTheArrayOfCountry];  //get the info of a Country.plist and save inside this array
    [self setTheArrayOfBeer]; //get the info of a Beer.plist and save inside this array
    [self printThePhotoAndNameOfaBeer:self.index];
    
    
}



//get the info of a Beer.plist and save inside this array
- (void)setTheArrayOfBeer{
    
    self.thePath = [self chekThePlistFileExistInDocuments];
    
    NSLog(@"%@", self.thePath);
    
    NSArray *theArrayFromPlist = [[NSArray alloc]initWithContentsOfFile:self.thePath];
    
    Beer *beer = [[Beer alloc] init];
    
    self.arrayOfBeers = [beer theArrayOfBeersFromDicts:theArrayFromPlist];
    
}


//get the info of a Country.plist and save inside this array
- (void)setTheArrayOfCountry{
    
    NSArray *theArrayOfCountries = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Country" ofType:@"plist"]];
    
    Country *country = [[Country alloc] init];
    
    self.arrayOfCountries = [country theArrayOfCountriesFromDicts:theArrayOfCountries];
    
}



// this method just print the photo and name of a beer
- (void)printThePhotoAndNameOfaBeer:(NSInteger)arrayIndex{
    
    UIImage *image = [UIImage imageNamed:[[self.arrayOfBeers objectAtIndex:arrayIndex] beerImage]];
    [self.beerImageViewStoryboard setImage:image];
    
    self.beerCountryLabel.text = [[self.arrayOfBeers objectAtIndex:arrayIndex] beerName];

}


// VALIDATE THE INDEX OF ANY ARRAY
- (void)validateIndexOfArray:(NSInteger)arrayIndex{
    
    if (arrayIndex==0) {
        [self.previousButtonProperty setEnabled:NO];
        [self.previousButtonProperty setAlpha:0.4];
    }else {
        [self.previousButtonProperty setEnabled:YES];
        [self.previousButtonProperty setAlpha:1];
    }
        
    if (arrayIndex<[self.arrayOfBeers count]-1){
        [self.nextButtonProperty setEnabled:YES];
        [self.nextButtonProperty setAlpha:1];
    } else {
        [self.nextButtonProperty setEnabled:NO];
        [self.nextButtonProperty setAlpha:0.4];
    }
}


// this segue send the default data
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showDetailOfBeers"])
    {
        // Get reference to the destination view controller
        DetailViewController *detailVC = [segue destinationViewController];

        // send the current beer
        detailVC.currentBeer = self.arrayOfBeers[self.index];
        
        //Find the index for the current country
        NSInteger countryIndex = 0; //index for the country array
        for (Country *country in self.arrayOfCountries){ //for all the countries
                                                         //find where the code is the same to the
                                                         //beer country code
        NSLog(@"CountryID: %@  BeerCountry: %@", country.ID, [[self.arrayOfBeers objectAtIndex:self.index] beerCountry]);
        if ([country.ID isEqualToNumber:[[self.arrayOfBeers objectAtIndex:self.index] beerCountry]]) {
                countryIndex = [[[self.arrayOfBeers objectAtIndex:self.index] beerCountry] integerValue]; //then save the index to send to the detail controller
        }
        
            
        }
        
        // send the current country
        detailVC.currentCountry = self.arrayOfCountries[countryIndex];
        
        detailVC.delegate = self;

    }

}


// get path from the plist in documents file
- (NSString *)chekThePlistFileExistInDocuments{
    
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Beer.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:path]){
        
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Beer" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:path error:&error];
    }
    
    
    
    
    return path;
    
}

//save the last index
-(void)viewDidDisappear:(BOOL)animated{
    [self.defaults setObject:[NSNumber numberWithInteger:self.index] forKey:@"indexArray"];
}


- (void) saveSettings{
    
    NSNumber *currentIndex = [NSNumber numberWithLong:self.index];
    [[NSUserDefaults standardUserDefaults] setObject:currentIndex forKey:@"currentIndex"];
    
}




- (void)addItemViewController:(DetailViewController *)controller
        didFinishEnteringItem:(NSString *)item{
    
    NSLog(@"Print delegate: %@", item);
    
    
}

@end

