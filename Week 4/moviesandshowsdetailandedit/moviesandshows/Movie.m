//
//  Movie.m
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)copyWithZone:(NSZone *)zone {
    Movie *newMovie = [[Movie allocWithZone:zone] init];
    if (newMovie != nil) {
//        newMovie.title = [self.title stringByAppendingString:@" (Copied)"];
        newMovie.title = self.title;
        newMovie.director = self.director;
    }
    return newMovie;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.director forKey:@"director"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.director = [aDecoder decodeObjectForKey:@"director"];
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    // If it's the same pointer don't need to check anything else
    if (self == object) {
        return YES;
    }
    
    // Check that it's the same class
    if (![object isKindOfClass:[Movie class]]) {
        return NO;
    }
    
    // Call to check all the movie properties
    return [self isEqualToMovie:object];
}

- (NSUInteger)hash {
    NSUInteger hash = [self.title hash] ^ [self.director hash];
    return hash;
}

- (BOOL)isEqualToMovie:(Movie *)movie {
    if (![self.title isEqualToString:movie.title]) {
        return NO;
    }
    if (![self.director isEqualToString:movie.director]) {
        return NO;
    }
    return YES;
}

@end
