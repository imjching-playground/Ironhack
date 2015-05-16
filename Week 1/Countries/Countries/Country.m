//
//  Country.m
//  Countries
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Country.h"

@implementation Country

- (instancetype)initCityWithName:(NSString *)myName cities:(NSArray *)myCities languages:(NSArray *)myLanguages{
    
    
    self = [super init];
    
    if (self) {
        
        _name = myName;
        _cities = myCities;
        _languages = myLanguages;
        
    }
    
    return self;
    
}


- (NSArray *)theArrayOfCountriesFromDicts:(NSArray *)originalArray {
    
    NSMutableArray *theArrayOfCountries = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eachDictionary in originalArray){
        
        
        Country *countries = [[Country alloc] initCityWithName:eachDictionary[@"name"] cities:eachDictionary[@"cities"] languages:eachDictionary[@"languages"]];
        
        
        [theArrayOfCountries addObject:countries];
        
    }
    
    
    return theArrayOfCountries;
    
}





@end
