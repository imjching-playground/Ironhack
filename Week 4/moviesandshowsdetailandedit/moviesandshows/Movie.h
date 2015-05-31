//
//  Movie.h
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject <NSCopying, NSCoding>

@property NSString *title;
@property NSString *director;

@end
