//
//  CoreDataEntityManager.h
//  UsingCoreData
//
//  Created by Georgios Pessios on 5/26/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DogEntity.h"

@interface CoreDataEntityManager : NSObject


@property(nonatomic,strong)NSManagedObjectContext *managedObjectContext;

//Singleton to access data
+(CoreDataEntityManager *)sharedEntityManager;

-(DogEntity *)createDogEntityWithBreed:(NSString *)breed;
-(DogEntity *)dogWithBreed: (NSString *)breed;
-(NSArray *) allDogs;

@end
