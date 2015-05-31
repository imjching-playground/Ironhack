//
//  PersistenceManager.m
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "PersistenceManager.h"

@implementation PersistenceManager

+ (NSString *)pathForFileWithClass:(Class)aClass {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // Get a string with @"Movie" or @"TVShow"
    NSString *classFile = NSStringFromClass(aClass);
    
    // Get the path with @"Movie.plist" or @"TVShow.plist"
    classFile = [classFile stringByAppendingString:@".plist"];
    
    return [documentsDirectory stringByAppendingPathComponent:classFile];

}

+ (id)copyEntity:(NSMutableArray *)array atIndex:(NSInteger)index {
    
    id oldCopy = array[index];
    
    id newCopy = [oldCopy copy];
    
    if ([newCopy respondsToSelector:@selector(title)]) {
        NSString *newTitle = [[newCopy title] stringByAppendingString:@" (Copied)"];
        [newCopy setTitle:newTitle];
        
        NSLog(@"TITLE: %@", [newCopy title]);
    }
    
    [array insertObject:newCopy atIndex:index+1];
    
    // After inserting the new movie save to disk
    NSString *path = [PersistenceManager pathForFileWithClass:[newCopy class]];
    [NSKeyedArchiver archiveRootObject:array toFile:path];
    
    return newCopy;
}

@end
