//
//  Domain+Model.h
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "Domain.h"

extern NSString *const domainEntityName;
extern NSString *const domainPropertyName;

@interface Domain (Model)

+ (instancetype) domainInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name;
+ (Domain *) fetchInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name;
+ (NSFetchRequest *) fetchForControlledDomains;

@end
