//
//  PersistenceManager.m
//  Copying
//
//  Created by Carlos Butron on 25/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "PersistenceManager.h"

@implementation PersistenceManager

+ (NSString *) pathForFileWithClass:(Class)aClass {
   
    
       NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
       NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //get a string with @"movie" or @tvshow"
    NSString *classFile = NSStringFromClass(aClass);
    
    //get the path with extension .plist
    classFile = [classFile stringByAppendingString:@".plist"];
    
    return [documentsDirectory stringByAppendingPathComponent:classFile];
    
    
}

+ (void) copyEntity:(NSMutableArray *)array atIndex:(NSInteger)index {

    id oldCopy = array[index];
    id newCopy = [oldCopy copy];
    
    NSLog(@"Title: %@", [newCopy title]);
    
    
    
    [array insertObject:newCopy atIndex:index];
    
    
    
    [newCopy setTitle:[[newCopy title] stringByAppendingString:@" (Copied)"]];
    

    
    //after inserting the new model save to disk
    NSString *path = [PersistenceManager pathForFileWithClass:[newCopy class]];
    
    [NSKeyedArchiver archiveRootObject:array toFile:path];
    

}


@end
