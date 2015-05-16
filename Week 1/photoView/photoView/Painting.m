//
//  Painting.m
//  Storyboard101
//
//  Created by Carlos Butron on 06/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Painting.h"

@implementation Painting


- (instancetype)initWithPhotoName:(NSString *)myPhotoName
                       photoTitle:(NSString *)myPhotoTitle
                           genius:(NSNumber *)myGenius {
    
    self = [super init];
    
    if (self) {
        
        _photoName = myPhotoName;
        _photoTitle = myPhotoTitle;
        _genius = myGenius;
        
    }
    
    return self;
    
}

- (NSArray *)theArrayOfPhotosFromDicts:(NSArray *)originalArray {
    
    NSMutableArray *theArrayOfPersons = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eachDictionary in originalArray){
        
        
        Painting *paintPhotos = [[Painting alloc]initWithPhotoName:eachDictionary[@"filename"] photoTitle:eachDictionary[@"title"] genius:eachDictionary[@"genius"]];
    
        
        [theArrayOfPersons addObject:paintPhotos];
        
    }
    
    
    return theArrayOfPersons;
    
}


@end
