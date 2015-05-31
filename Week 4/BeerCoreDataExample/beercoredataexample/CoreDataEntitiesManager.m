//
//  CoreDataEntitiesManager.m
//  BeerCoreDataExample
//
//  Created by Georgios Pessios on 5/28/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "CoreDataEntitiesManager.h"
#import "CoreDataStack.h"

@interface CoreDataEntitiesManager ()

@property CoreDataStack *coreDataStack;

@end

@implementation CoreDataEntitiesManager


-(instancetype)init{

    self = [super init];
    
    if(self){
        
        //Here is where we initialize our CoreDataStack
        self.coreDataStack = [[CoreDataStack alloc] initWithModelName:@"BeerCountryModel"];
    
    }
    
    return self;

}


//Singleton sharedEntitiesManager
+(id)sharedEntitiesManager{

    static CoreDataEntitiesManager *sharedEntitiesManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedEntitiesManager = [[self alloc]init];
    
    });
    
    return sharedEntitiesManager;

}

#pragma mark - save method for both entities

-(void)save{
    
    NSError *error= nil;
    
    [self.coreDataStack.managedObjectContext save:&error];
    
    if(error != nil){
        
        NSLog(@"Error saving changes!");
        
    
    }else{
    
        NSLog(@"Successfully saved all changes!");
    
    }

}

#pragma mark - CRUD methods for CountryEntity

//Create CountryEntity (Crud)
-(CountryEntity *)createCountryWithName:(NSString *)name andWithFlag:(NSString *)flag{

    CountryEntity *country = [NSEntityDescription insertNewObjectForEntityForName:@"CountryEntity" inManagedObjectContext:self.coreDataStack.managedObjectContext];
    
    country.name = name;
    country.flag = flag;
    
    //Calling the save method in order to tell managedObjectContext to save the changes
    [self save];
    
    return country;

}

//Read CountryEntity (cRud)


//Update CountryEntity (crUd)


//Delete CountryEntity (cruD)




#pragma mark - CRUD methods for BeerEntity

//Create BeerEntity (Crud)

-(BeerEntity *)createBeerWithName:(NSString *)name andWithWithImage:(NSString *)image andWithStock:(NSInteger)stock{

    BeerEntity *beer = [NSEntityDescription insertNewObjectForEntityForName:@"BeerEntity" inManagedObjectContext:self.coreDataStack.managedObjectContext];
    
    beer.name = name;
    beer.image = image;
    beer.stock = (int32_t)stock;
    
    //Calling the save method in order to tell managedObjectContext to save the changes
    [self save];
    
    return beer;
    
}


@end
