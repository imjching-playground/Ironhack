//
//  CoreDataStack.h
//  UsingCoreData
//
//  Created by Georgios Pessios on 5/26/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (nonatomic, readonly)NSManagedObjectContext *managedObjectContext;
@property (nonatomic, readonly)NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly)NSManagedObjectModel *managedObjectModel;


-(instancetype)initWithModelName: (NSString *)modelName;

@end
