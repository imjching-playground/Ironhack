//
//  TVShowsDataManager.h
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TVShow.h"

@interface TVShowsDataManager : NSObject

// Singleton to access data
+ (TVShowsDataManager *)sharedManager;

@property (readonly) NSManagedObjectContext *moc;

- (TVShow *)createTVShowWithTitle:(NSString *)title numberOfSeasons:(NSInteger)numberOfSeasons;

- (TVShow *)tvShowWithTitle:(NSString *)title;

- (NSArray *)allTVShows;

- (void)deleteTVShow:(TVShow *)tvshow;

- (void)save;

@end
