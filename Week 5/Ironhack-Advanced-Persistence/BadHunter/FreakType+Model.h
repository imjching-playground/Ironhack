//
//  FreakType+Model.h
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "FreakType.h"

extern NSString *const freakTypeEntityName;
extern NSString *const freakTypePropertyName;

@interface FreakType (Model)

+ (instancetype) freakTypeInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name;
+ (FreakType *) fetchInMOC:(NSManagedObjectContext *)moc withName:(NSString *)name;

@end
