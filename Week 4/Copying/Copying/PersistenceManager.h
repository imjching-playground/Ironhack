//
//  PersistenceManager.h
//  Copying
//
//  Created by Carlos Butron on 25/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistenceManager : NSObject

+ (NSString *) pathForFileWithClass:(Class)aClass;
+ (void) copyEntity:(NSMutableArray *)array atIndex:(NSInteger)index;


@end
