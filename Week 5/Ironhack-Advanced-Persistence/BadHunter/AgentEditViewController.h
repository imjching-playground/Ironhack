//
//  DetailViewController.h
//  BadHunter
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DismissProtocol.h"
#import <CoreData/CoreData.h>


@interface AgentEditViewController : UIViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) id agent;

// Delegate to respond back
@property (weak, nonatomic) id <DismissProtocolDelegate>delegate;





@end

