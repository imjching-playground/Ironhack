//
//  CoreDataStack.m
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "CoreDataStack.h"

@interface CoreDataStack ()

// Override the readonly so we have the internal _managedObjectContext
@property NSManagedObjectContext *managedObjectContext;
@property NSPersistentStoreCoordinator *persistenceStoreCoordinator;
@property NSManagedObjectModel *managedObjectModel;

// Name of the entity that we're managing
@property NSString *modelName;
@end

@implementation CoreDataStack

- (instancetype)initWithModelName:(NSString *)modelName {
    self = [super init];
    if (self) {
        _modelName = modelName;
    }
    return self;
}

- (NSURL *)storeURL {
    // Get the real sqlite file path
    NSString *sqliteFile = [NSString stringWithFormat:@"TVShows.sqlite"];
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:sqliteFile];
}

// Accessing the .managedObjectContext property calls this method
- (NSManagedObjectContext *)managedObjectContext {
    // First time we initialize it
    // Internal variable will be nil the first time
    if (_managedObjectContext == nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        _managedObjectContext.persistentStoreCoordinator = self.persistenceStoreCoordinator;
    }
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistenceStoreCoordinator {
    if (_persistenceStoreCoordinator == nil) {
        _persistenceStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        // Define where the actual data will be saved on disk
        NSURL *url = [self storeURL];
        NSError *error = nil;
        [_persistenceStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
        if (error != nil) {
            // Something has failed. Maybe there's no space on the device
            // We don't know how to deal with the error, close the app and
            // pray that the next time it works.
            abort();
        }
    }
    return _persistenceStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel == nil) {
        // Initialize with .momd file that defines our model structure
        NSURL *dataModelURL = [[NSBundle mainBundle] URLForResource:self.modelName withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:dataModelURL];
    }
    return _managedObjectModel;
}


@end
