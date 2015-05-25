//
//  MovieModel.m
//  Copying
//
//  Created by Filipe Patrício on 25/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "MovieModel.h"

@interface MovieModel () <NSCopying, NSCoding>

@end

@implementation MovieModel

-(id)copyWithZone:(NSZone *)zone
{
    MovieModel *copyMovie = [[MovieModel alloc]init];
    if(copyMovie)
    {
        copyMovie.title = self.title;
        copyMovie.director = self.director;
    }
    
    return copyMovie;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.director forKey:@"director"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if(self)
    {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.director = [aDecoder decodeObjectForKey:@"director"];
    }
    return self;
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else if(![other isKindOfClass:[MovieModel class]]){
        return NO;
    }
    return [self isEqualToMovie:other];
}

- (BOOL)isEqualToMovie:(MovieModel*)otherMovie
{
    if ([self.title isEqualToString:otherMovie.title])
    {
        return YES;
    }
    else if ([self.director isEqualToString:otherMovie.director])
    {
        return YES;
    }
    else
        return NO;
}

- (NSUInteger)hash
{
    NSUInteger hash = self.title.hash ^ self.director.hash;
    return hash;
}



@end
