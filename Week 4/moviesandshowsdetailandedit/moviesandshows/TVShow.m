//
//  TVShow.m
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "TVShow.h"

@implementation TVShow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"title" : @"title",
             @"numberOfSeasons" : @"num_seasons"
             };
}

@end
