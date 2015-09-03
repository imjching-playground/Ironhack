//
//  Agent+Model.h
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "Agent.h"


extern NSString *const agentPropertyAppraisal;
extern NSString *const agentPropertyName;
extern NSString *const agentPropertyDestructionPower;
extern NSString *const agentPropertyMotivation;
extern NSString *const agentPropertyPictureUUID;

@interface Agent (Model)

+ (NSFetchRequest *) fetchForAllAgents;
+ (NSFetchRequest *) fetchForAllAgentsWithPredicate:(NSPredicate *)predicate;
+ (NSFetchRequest *) fetchForAllAgentsWithSortDescriptors:(NSArray *)sortDescriptors;
- (NSString *) generatePictureUUID;

@end
