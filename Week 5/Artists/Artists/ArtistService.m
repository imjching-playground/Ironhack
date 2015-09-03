//
//  ArtistService.m
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ArtistService.h"
#import "Artist.h"

@interface ArtistService ()

@property (nonatomic, strong) NSMutableArray *theArrayOfArtists;
@property (nonatomic, strong) NSMutableSet *differentArtist;

@end

@implementation ArtistService




- (void)artistsWithCompletion:(void (^)(NSArray *))completion{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *docs = [documentsDirectory stringByAppendingPathComponent:@"theArtist"];
    
    self.theArrayOfArtists = [NSKeyedUnarchiver unarchiveObjectWithFile:docs];
    
    if (self.theArrayOfArtists != nil) {
     
        completion([self.theArrayOfArtists copy]);
        
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"https://ironhackartists.firebaseio.com/artists.json"]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                // handle response
                
                NSArray *array = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:kNilOptions error:&error];
                
                
                
                //todo
                self.differentArtist = [[NSMutableSet alloc] init];

                for (NSDictionary *eachDictionary in array) {
                    
                    Artist *artist = [[Artist alloc]initWithArtistID:(int)eachDictionary[@"id"] andLongDescription:eachDictionary[@"description"] andImageURL:[NSURL URLWithString:eachDictionary[@"image_url"]]  andName:eachDictionary[@"name"] andStage:eachDictionary[@"stage"] andStartDate:eachDictionary[@"start_date"]];
                    
                    [self.differentArtist addObject:artist];
                    
                }
                
                self.theArrayOfArtists = [[NSMutableArray alloc] initWithArray:[self.differentArtist allObjects]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                
                completion([self.theArrayOfArtists copy]);
                    
                });
                
                [NSKeyedArchiver archiveRootObject:self.theArrayOfArtists toFile:docs];
                
            }] resume];
        
    
    
}

@end
