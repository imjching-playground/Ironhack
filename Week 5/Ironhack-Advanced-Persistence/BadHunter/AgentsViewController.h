//
//  MasterViewController.h
//  BadHunter
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AgentsViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

