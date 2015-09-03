//
//  Artist.m
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Artist.h"
#import "NSString+Random.h"

@implementation Artist


- (instancetype)initWithArtistID:(NSInteger)artistID
              andLongDescription:(NSString *)longDescription
                     andImageURL:(NSURL *)imageURL
                         andName:(NSString *)name
                        andStage:(NSString *)stage
                    andStartDate:(NSDate *)startDate {
 
    self = [self init];
    
    if (self) {
        
        self.artistID = artistID;
        self.longDescription = longDescription;
        self.imageURL = imageURL;
        self.name = name;
        self.stage = stage;
        self.startDate = startDate;
        
    }
    
    return self;
    
}



- (id)copyWithZone:(NSZone *)zone {
    
    Artist *artistCopy = [[[self class] allocWithZone:zone] init];
    
    if (artistCopy) {
        //objects
        artistCopy.longDescription = [self.longDescription copyWithZone:zone];
        artistCopy.imageURL = [self.imageURL copyWithZone:zone];
        artistCopy.name = [self.name copyWithZone:zone];
        artistCopy.stage = [self.stage copyWithZone:zone];
        artistCopy.startDate = [self.startDate copyWithZone:zone];
        
        //scalars
        artistCopy.artistID = self.artistID;
    }
    
    return artistCopy;
    
}


+ (instancetype)randomArtist {
    
    NSUInteger r = arc4random_uniform(100) + 1;
    [NSString randomNameGenerator:r];
    
    Artist *artist = [[Artist alloc] initWithArtistID:r
                                   andLongDescription:[NSString randomNameGenerator:r]
                                          andImageURL:[NSURL URLWithString:@"http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2014/4/11/1397210130748/Spring-Lamb.-Image-shot-2-011.jpg"]
                                              andName:[NSString randomNameGenerator:r]
                                             andStage:[NSString randomNameGenerator:r]
                                         andStartDate:[NSDate date]];
    
    return artist;
    
    
    
    
}




- (void)encodeWithCoder:(NSCoder *)enCoder {
    [enCoder encodeInteger:self.artistID forKey:@"id"];
    [enCoder encodeObject:self.longDescription forKey:@"description"];
    [enCoder encodeObject:self.imageURL forKey:@"image_url"];
    [enCoder encodeObject:self.name forKey:@"name"];
    [enCoder encodeObject:self.stage forKey:@"stage"];
    [enCoder encodeObject:self.startDate forKey:@"start_date"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    NSInteger aID = [decoder decodeIntegerForKey:@"id"];
    NSString *longDescription = [decoder decodeObjectForKey:@"description"];
    NSURL *imageURL = [decoder decodeObjectForKey:@"image_url"];
    NSString *name = [decoder decodeObjectForKey:@"name"];
    NSString *stage = [decoder decodeObjectForKey:@"stage"];
    NSDate *startDate = [decoder decodeObjectForKey:@"start_date"];
    
    return [self initWithArtistID:aID andLongDescription:longDescription andImageURL:imageURL andName:name andStage:stage andStartDate:startDate];
}




- (BOOL)isEqual:(id)object {
    // If it's the same pointer don't need to check anything else
    if (self == object) {
        return YES;
    }
    
    // Check that it's the same class
    if (![object isKindOfClass:[Artist class]]) {
        return NO;
    }
    
    // Call to check all the movie properties
    return [self isEqualToArtist:object];
}

- (NSUInteger)hash {
    NSUInteger hash = [self.name hash] ^ [self.stage hash];
    return hash;
}

- (BOOL)isEqualToArtist:(Artist *)artist {
    if (![self.name isEqualToString:artist.name]) {
        return NO;
    }
    if (![self.stage isEqualToString:artist.stage]) {
        return NO;
    }
    return YES;
}







@end
