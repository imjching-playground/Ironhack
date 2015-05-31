//
//  CoreDataStack.h
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

// Lazy initialized, created the first time we need it
@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistenceStoreCoordinator;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;


- (instancetype)initWithModelName:(NSString *)modelName;

@end
