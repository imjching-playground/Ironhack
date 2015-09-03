//
//  Domain+Model.m
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "Domain+Model.h"

NSString *const domainEntityName = @"Domain";
NSString *const domainPropertyName = @"name";

@implementation Domain (Model)

+ (instancetype) domainInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name {
    Domain *domain = [NSEntityDescription insertNewObjectForEntityForName:domainEntityName
                                                   inManagedObjectContext:moc];
    domain.name = name;
    
    return domain;
}


+ (Domain *) fetchInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:domainEntityName];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@", domainPropertyName, name];
    
    NSArray *results = [moc executeFetchRequest:fetchRequest error:NULL];
    
    return [results lastObject];
}

+ (NSFetchRequest *) fetchForControlledDomains {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:domainEntityName];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"(SUBQUERY(agents,$x,$x.destructionPower >= 3)).@count > 1"];

    return fetchRequest;
}

@end
