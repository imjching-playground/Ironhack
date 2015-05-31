//
//  CountryEntity.h
//  BeerCoreDataExample
//
//  Created by Georgios Pessios on 5/28/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BeerEntity;

@interface CountryEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * flag;
@property (nonatomic, retain) NSSet *beer;
@end

@interface CountryEntity (CoreDataGeneratedAccessors)

- (void)addBeerObject:(BeerEntity *)value;
- (void)removeBeerObject:(BeerEntity *)value;
- (void)addBeer:(NSSet *)values;
- (void)removeBeer:(NSSet *)values;

@end
