//
//  Country.h
//  OnlyBeers
//
//  Created by Carlos Butron on 09/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *flag;


- (instancetype)initWithID:(NSNumber *)myID
                      name:(NSString *)myName
                      flag:(NSString *)myFlag;

- (NSArray *)theArrayOfCountriesFromDicts:(NSArray *)originalArray;

@end
