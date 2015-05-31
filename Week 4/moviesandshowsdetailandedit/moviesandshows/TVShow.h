//
//  TVShow.h
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface TVShow : MTLModel <MTLJSONSerializing>

@property NSString *title;
@property NSUInteger numberOfSeasons;

@end
