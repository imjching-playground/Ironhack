//
//  CoreDataStack.m
//  UsingCoreData
//
//  Created by Georgios Pessios on 5/26/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "CoreDataStack.h"
@interface CoreDataStack ()

//All properties are accessible only privately
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong)NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong)NSURL *dogModelURL;
@property (nonatomic, strong)NSString *modelName;


@end


@implementation CoreDataStack



//Designated initializer
-(instancetype)initWithModelName: (NSString *)modelName{
    self = [self init];
    
    if(self){
    
        self.modelName = modelName;
    
    }
    
    return self;
}



-(NSManagedObjectContext *)managedObjectContext{
    
    //Lazy initialization
    if(_managedObjectContext == nil){
        
        _managedObjectContext = [[NSManagedObjectContext alloc]init];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        
    }
    
    return _managedObjectContext;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    
    if(_persistentStoreCoordinator == nil){
        
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        //Define where the data will be saved
        NSURL *url = [self storeURL];
        NSError *error = nil;
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
        if(error != nil){
            
            //Something failed.
            abort();
            
        }
        
    }
    
    return _persistentStoreCoordinator;
}

-(NSManagedObjectModel *)managedObjectModel{
    
    if(_managedObjectModel == nil){
        
        //Initialize with .momd file that defines our model structure
        
        self.dogModelURL = [[NSBundle mainBundle] URLForResource:self.modelName withExtension:@"momd"];
        
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.dogModelURL];
        
        
    }
    
    return _managedObjectModel;
}


-(NSURL *)storeURL{
    NSString *sqliteFile = [NSString stringWithFormat:@"DogModel.sqlite"];
    
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:sqliteFile];
    
}

@end
