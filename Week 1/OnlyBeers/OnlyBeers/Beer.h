//
//  Beer.h
//  OnlyBeers
//
//  Created by Carlos Butron on 08/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject

@property (nonatomic, strong) NSString *beerName;
@property (nonatomic, strong) NSNumber *beerCountry;
@property (nonatomic, strong) NSString *beerImage;
@property (nonatomic, strong) NSNumber *beerAlcohol;


- (instancetype)initWithBeerName:(NSString *)myBeerName
                     beerCountry:(NSString *)myBeerCountry
                       beerImage:(NSString *)myBeerImage
                     beerAlcohol:(NSNumber *)myBeerAlcohol;

- (NSArray *)theArrayOfBeersFromDicts:(NSArray *)originalArray;

@end
