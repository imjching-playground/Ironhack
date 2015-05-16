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
                       photoTitle:(NSString *)myPhotoTitle { 
    
    self = [super init];
    
    if (self) {
        
        _photoName = myPhotoName;
        _photoTitle = myPhotoTitle;
        
    }
    
    return self;
    
}


@end
