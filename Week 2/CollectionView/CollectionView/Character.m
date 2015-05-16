//
//  character.m
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype) initWithName:(NSString *)characterName
                    imageName:(NSString *)characterImageName {
    
    self = [self init];
    
    if (self) {
        
        self.name = characterName;
        self.imageName = characterImageName;
        
    }
    
    return self;
    
}

@end
