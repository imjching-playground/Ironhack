//
//  CoreDataEntitiesManager.h
//  BeerCoreDataExample
//
//  Created by Georgios Pessios on 5/28/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountryEntity.h"
#import "BeerEntity.h"

@interface CoreDataEntitiesManager : NSObject


//Class method to access the singleton sharedEntitiesmanager
+(id)sharedEntitiesManager;

-(CountryEntity *)createCountryWithName:(NSString *)name andWithFlag:(NSString *)flag;

@end
