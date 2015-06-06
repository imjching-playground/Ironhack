//
//  FreakType+Model.m
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "FreakType+Model.h"

NSString *const freakTypeEntityName = @"FreakType";
NSString *const freakTypePropertyName = @"name";

@implementation FreakType (Model)

+ (instancetype) freakTypeInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name {
    FreakType *freakType = [NSEntityDescription insertNewObjectForEntityForName:freakTypeEntityName
                                                         inManagedObjectContext:moc];
    freakType.name = name;
    
    return freakType;
}


+ (FreakType *) fetchInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:freakTypeEntityName];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"%K == %@",
                              freakTypePropertyName, name];
    
    return [[moc executeFetchRequest:fetchRequest error:NULL] firstObject];
}

@end
