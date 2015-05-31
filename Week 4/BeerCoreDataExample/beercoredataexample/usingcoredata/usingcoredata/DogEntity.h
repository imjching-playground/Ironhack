//
//  DogEntity.h
//  UsingCoreData
//
//  Created by Georgios Pessios on 5/26/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DogEntity : NSManagedObject

@property (nonatomic, retain) NSString * breed;

@end
