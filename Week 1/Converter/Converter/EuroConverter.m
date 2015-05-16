//
//  EuroConverter.m
//  Converter
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "EuroConverter.h"


@implementation EuroConverter

#define ConvertNumber 166.386




- (instancetype)initWithMoney:(float)myMoney{
    
    self = [super init];
    
    if (self) {
        
        self.money = myMoney;


        
    }
    
    return self;
    
}




- (float)convertToEuro{
    
    float toEuro;
    
    toEuro = self.money * ConvertNumber;
    
    return toEuro;
    
}


- (long)convertToPeseta{
    
    long toPesetas;
    
    toPesetas = self.money / ConvertNumber;
    
    return toPesetas;
}

+ (float)convertFromEuroToPeseta:(int)pesetas{
    
    pesetas = pesetas * ConvertNumber;
    
    return pesetas;
}

+ (int)convertFromPesetaToEuro:(float)euros{
    
    euros = euros / ConvertNumber;
   
    return euros;
}

@end
