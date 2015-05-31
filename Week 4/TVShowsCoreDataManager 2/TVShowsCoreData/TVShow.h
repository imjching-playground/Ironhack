//
//  TVShow.h
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TVShow : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * numberOfSeasons;

@end
