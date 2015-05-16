//
//  Country.h
//  Countries
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *languages;


- (instancetype)initCityWithName:(NSString *)myName cities:(NSArray *)myCities languages:(NSArray *)myLanguages;

- (NSArray *)theArrayOfCountriesFromDicts:(NSArray *)originalArray;

@end
