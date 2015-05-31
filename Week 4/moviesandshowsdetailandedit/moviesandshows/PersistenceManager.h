//
//  PersistenceManager.h
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistenceManager : NSObject

+ (NSString *)pathForFileWithClass:(Class)aClass;
+ (id)copyEntity:(NSMutableArray *)array atIndex:(NSInteger)index;

@end
