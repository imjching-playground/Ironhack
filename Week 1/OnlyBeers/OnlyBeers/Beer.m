//
//  Beer.m
//  OnlyBeers
//
//  Created by Carlos Butron on 08/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Beer.h"

@implementation Beer

// designated init

- (instancetype)initWithBeerName:(NSString *)myBeerName
                     beerCountry:(NSNumber *)myBeerCountry
                       beerImage:(NSString *)myBeerImage
                     beerAlcohol:(NSNumber *)myBeerAlcohol{
    
    self = [super init];
    
    if (self){
        
        _beerName = myBeerName;
        _beerCountry = myBeerCountry;
        _beerImage = myBeerImage;
        _beerAlcohol = myBeerAlcohol;
        
    }
    
    return self;
}


//get the array from bundle and return and array formated with class Beers options inside

- (NSArray *)theArrayOfBeersFromDicts:(NSArray *)originalArray {
    
    NSMutableArray *theArrayOfBeers = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eachDictionary in originalArray){
        
        
        Beer *beer = [[Beer alloc] initWithBeerName:eachDictionary[@"name"] beerCountry:eachDictionary[@"country"] beerImage:eachDictionary[@"image"] beerAlcohol:eachDictionary[@"alcohol"]];
        
        
        [theArrayOfBeers addObject:beer];
        
    }
    
    
    return theArrayOfBeers;
    
}


@end
