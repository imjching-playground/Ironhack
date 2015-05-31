//
//  Beer.m
//  AFBeers
//
//  Created by Marc on 27/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "Beer.h"

@implementation Beer

// Tell Mantle how we want to map our properties to the JSON keys when the Beer objects are created
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"information" : @"description", // description in JSON will be mapped to self.information
             @"labelImageURL" : @"labels.large", // JSON labels contains a dictionary with icon,medium,large URLs
             @"labelThumbnailURL" : @"labels.icon"
             };
}

@end
