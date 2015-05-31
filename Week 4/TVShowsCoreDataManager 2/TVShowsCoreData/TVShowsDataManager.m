//
//  TVShowsDataManager.m
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "TVShowsDataManager.h"
#import "CoreDataStack.h"

@interface TVShowsDataManager ()

@property CoreDataStack *coreDataStack;

@end

@implementation TVShowsDataManager

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize CoreDataStack for our app
        self.coreDataStack =
        [[CoreDataStack alloc] initWithModelName:@"TVShows"];
    }
    return self;
}

- (NSManagedObjectContext *)moc {
    return self.coreDataStack.managedObjectContext;
}

+ (TVShowsDataManager *)sharedManager {
    // static var means that there's only one instance ever
    static TVShowsDataManager *manager;
    if (manager == nil) {
        manager = [[TVShowsDataManager alloc] init];
    }
    return manager;
}

#pragma mark - CRUD (Create Read Update Delete)

// CREATE
- (TVShow *)createTVShowWithTitle:(NSString *)title numberOfSeasons:(NSInteger)numberOfSeasons {
    
    // Create a new show in our Core Data stack
    TVShow *tvShow = [NSEntityDescription insertNewObjectForEntityForName:@"TVShow" inManagedObjectContext:self.moc];
    tvShow.title = title;
    tvShow.numberOfSeasons = @(numberOfSeasons);
    
    NSError *error;
    [self.moc save:&error];
    if (error != nil) {
        NSLog(@"ERROR!!!!!!1!");
    }
    
    return tvShow;
}

// READ - Finds TV Show with specific title in our database
- (TVShow *)tvShowWithTitle:(NSString *)title {
    // To find stuff in our DB we use a Fetch Request
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    // Predicate defines what we want to search for
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
    // Execute the fetch request in our database. Always an array
    NSArray *results = [self.moc executeFetchRequest:fetchRequest error:nil];
    // Return only the first result because we want a single TVShow
    return [results firstObject];
}

- (NSArray *)allTVShows {
    // To find stuff in our DB we use a Fetch Request
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    // Predicate that finds everything
    fetchRequest.predicate = [NSPredicate predicateWithValue:YES];
    // Execute the fetch request in our database. Always an array
    NSArray *results = [self.moc executeFetchRequest:fetchRequest error:nil];
    // Return the whole array
    return results;
}

// DELETE one tv show
- (void)deleteTVShow:(TVShow *)tvshow {
    [self.moc deleteObject:tvshow];
    
    NSError *error;
    [self.moc save:&error];
    if (error) {
        NSLog(@"Error deleting TVShow");
    }
}

// UPDATE: Save all changes
- (void)save {
    NSError *error;
    [self.moc save:&error];
    if (error) {
        NSLog(@"Error updating TVShows");
    }
}

@end
