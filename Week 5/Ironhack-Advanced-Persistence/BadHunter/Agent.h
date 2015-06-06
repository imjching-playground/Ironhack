//
//  Agent.h
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Domain, FreakType;

@interface Agent : NSManagedObject

@property (nonatomic, retain) NSNumber * appraisal;
@property (nonatomic, retain) NSNumber * destructionPower;
@property (nonatomic, retain) NSNumber * motivation;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * pictureUUID;
@property (nonatomic, retain) FreakType *category;
@property (nonatomic, retain) NSSet *domains;
@end

@interface Agent (CoreDataGeneratedAccessors)

- (void)addDomainsObject:(Domain *)value;
- (void)removeDomainsObject:(Domain *)value;
- (void)addDomains:(NSSet *)values;
- (void)removeDomains:(NSSet *)values;

@end
