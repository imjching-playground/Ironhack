//
//  Country.m
//  OnlyBeers
//
//  Created by Carlos Butron on 09/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Country.h"

@implementation Country

// designated init

- (instancetype)initWithID:(NSNumber *)myID
                      name:(NSString *)myName
                      flag:(NSString *)myFlag{
    
    self = [super init];
    
    if (self) {
        
        _ID = myID;
        _name = myName;
        _flag = myFlag;
        
    }
    
    return self;
    
}

//get the array from bundle and return and array formated with class Country options inside

- (NSArray *)theArrayOfCountriesFromDicts:(NSArray *)originalArray {
    
    NSMutableArray *theArrayOfCountries = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eachDictionary in originalArray){
        
        
        Country *country = [[Country alloc] initWithID:eachDictionary[@"id"] name:eachDictionary[@"name"] flag:eachDictionary[@"flag"]];
        
        [theArrayOfCountries addObject:country];
        
    }
    
    
    return theArrayOfCountries;
    
}



@end
