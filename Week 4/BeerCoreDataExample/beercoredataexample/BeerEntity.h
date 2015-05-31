//
//  BeerEntity.h
//  BeerCoreDataExample
//
//  Created by Georgios Pessios on 5/28/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CountryEntity;

@interface BeerEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t stock;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) CountryEntity *country;

@end
