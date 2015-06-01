//
//  ArtistService.h
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistService : NSObject

- (void)artistsWithCompletion:(void (^)(NSArray *))completion;

@end
