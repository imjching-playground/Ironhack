//
//  EuroConverter.h
//  Converter
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EuroConverter : NSObject

@property (nonatomic) float money;


//- (float)convertToEuro;
- (long)convertToPeseta;

+ (float)convertFromEuroToPeseta:(int)pesetas;
+ (int)convertFromPesetaToEuro:(float)euros;

- (instancetype)initWithMoney:(float)myMoney;
//+ convertFromCurrency:(CURRENCY)originCurrency toCurrency:(CURRENCY)destinationCurrency;



@end
