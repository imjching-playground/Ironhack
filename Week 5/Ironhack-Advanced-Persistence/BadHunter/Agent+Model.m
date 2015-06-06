//
//  Agent+Model.m
//  BadHunter
//
//  Created by Joan Romano on 6/3/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "Agent+Model.h"

NSString *const agentEntityName = @"Agent";
NSString *const agentPropertyName = @"name";
NSString *const agentPropertyAppraisal = @"appraisal";
NSString *const agentPropertyDestructionPower = @"destructionPower";
NSString *const agentPropertyMotivation = @"motivation";
NSString *const agentPropertyPictureUUID = @"pictureUUID";

@implementation Agent (Model)

#pragma mark - Dependencies

+ (NSSet *) keyPathsForValuesAffectingAppraisal {
    return [NSSet setWithArray:@[agentPropertyDestructionPower,
                                 agentPropertyMotivation]];
}


#pragma mark - Custom getters & setters

- (NSNumber *) appraisal {
    NSNumber *appraisalValue;
    if ([self primitiveValueForKey:agentPropertyAppraisal] == nil) {
        [self updateAppraisalValue];
    }
    [self willAccessValueForKey:agentPropertyAppraisal];
    appraisalValue = [self primitiveValueForKey:agentPropertyAppraisal];
    [self didAccessValueForKey:agentPropertyAppraisal];
    
    return appraisalValue;
}


- (void) setDestructionPower:(NSNumber *)destructionPower {
    [self willChangeValueForKey:agentPropertyDestructionPower];
    [self setPrimitiveValue:destructionPower forKey:agentPropertyDestructionPower];
    [self updateAppraisalValue];
    [self didChangeValueForKey:agentPropertyDestructionPower];
}


- (void) setMotivation:(NSNumber *)motivation {
    [self willChangeValueForKey:agentPropertyMotivation];
    [self setPrimitiveValue:motivation forKey:agentPropertyMotivation];
    [self updateAppraisalValue];
    [self didChangeValueForKey:agentPropertyMotivation];
}


- (void) updateAppraisalValue {
    NSUInteger destructionPower = [self.destructionPower unsignedIntegerValue];
    NSUInteger motivation = [self.motivation unsignedIntegerValue];
    NSUInteger appraisal = (destructionPower + motivation) / 2;
    [self setPrimitiveValue:@(appraisal) forKey:agentPropertyAppraisal];
}

#pragma mark - Fetch requests

+ (NSFetchRequest *) fetchForAllAgentsWithSortDescriptors:(NSArray *)sortDescriptors {
    NSFetchRequest *fetchRequest = [Agent baseFetchForAgents];
    fetchRequest.sortDescriptors = sortDescriptors;
    
    return fetchRequest;
}


+ (NSFetchRequest *) fetchForAllAgents {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:agentPropertyName
                                                                   ascending:YES];
    
    return [Agent fetchForAllAgentsWithSortDescriptors:@[sortDescriptor]];
}


+ (NSFetchRequest *) fetchForAllAgentsWithPredicate:(NSPredicate *)predicate {
    NSFetchRequest *fetchRequest = [Agent fetchForAllAgents];
    fetchRequest.predicate = predicate;
    
    return fetchRequest;
}


+ (NSFetchRequest *) baseFetchForAgents {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:agentEntityName];
    fetchRequest.fetchBatchSize = 20;
    
    return fetchRequest;
}

#pragma mark - Picture logic

- (NSString *) generatePictureUUID {
    CFUUIDRef     fileUUID;
    CFStringRef   fileUUIDString;
    fileUUID = CFUUIDCreate(kCFAllocatorDefault);
    fileUUIDString = CFUUIDCreateString(kCFAllocatorDefault, fileUUID);
    CFRelease(fileUUID);
    return (__bridge_transfer NSString *)fileUUIDString;
}

@end
