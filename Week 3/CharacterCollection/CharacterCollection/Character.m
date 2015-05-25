//
//  Character.m
//  CharacterCollection
//
//  Created by Carlos Butron on 20/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype)initWithName:(NSString *)characterName photo:(NSString *)characterPhoto {
    
    
    self = [self init];
    
    if (self) {
        
        self.name = characterName;
        self.photo = characterPhoto;
        
    }
    
    return self;
    
}


+ (NSArray *)theArrayOfCharactersFromDicts:(NSArray *)originalArray {
    
    NSMutableArray *theArrayOfCharacters = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eachDictionary in originalArray){
        
        Character *character = [[Character alloc] initWithName:eachDictionary[@"name"] photo:eachDictionary[@"image"]];
        
        [theArrayOfCharacters addObject:character];
        
    }
    
    return theArrayOfCharacters;
}



@end
