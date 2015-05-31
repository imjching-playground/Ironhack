//
//  CoreDataEntityManager.m
//  UsingCoreData
//
//  Created by Georgios Pessios on 5/26/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "CoreDataEntityManager.h"
#import "CoreDataStack.h"

@interface CoreDataEntityManager ()

@property(nonatomic, strong)CoreDataStack *coreDataStack;

@end

@implementation CoreDataEntityManager


-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        self.coreDataStack = [[CoreDataStack alloc]initWithModelName:@"DogModel"];
        
        
    }
    
    return self;
    
}

-(NSManagedObjectContext *)managedObjectContext{
    
    return self.coreDataStack.managedObjectContext;
    
}

//Singleton
+(CoreDataEntityManager *)sharedEntityManager{
    
    static CoreDataEntityManager *entityManager;
    if(entityManager == nil){
        
        entityManager = [[CoreDataEntityManager alloc] init];
    }
    
    
    return entityManager;
}


#pragma mark - CRUD (CREATE READ UPDATE DELETE) for Core Data

//CREATE
-(DogEntity *)createDogEntityWithBreed:(NSString *)breed{
    
    DogEntity *dog = [NSEntityDescription insertNewObjectForEntityForName:@"DogEntity" inManagedObjectContext:self.managedObjectContext];
    
    dog.breed = breed;
    
    NSError *error = nil;
    
    
    [self.managedObjectContext save:&error];
    
    if(error == nil){
        
        NSLog(@"Successfully Saved Data to DogEntity!");
        
    }
    return dog;
}

//READ
-(DogEntity *)dogWithBreed:(NSString *)breed{
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DogEntity"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"breed = %@", breed];
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error == nil) {
        return [results firstObject];
    }else{
        NSLog(@"ERROR!");
        return nil;
    }
    
}

-(NSArray *) allDogs{
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DogEntity"];
    fetchRequest.predicate = [NSPredicate predicateWithValue:YES];
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return results;
    
}


@end
