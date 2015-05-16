//
//  WorldOf.m
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "WorldOf.h"
#import "Character.h"

@implementation WorldOf




- (instancetype)initWithName:(NSString *)worldOfName
                   imageName:(NSString *)worldOfImageName
                   characters:(NSArray  *)worldOfCharacters{
    
    
    self = [self init];
    
    if (self) {
        
        self.name = worldOfName;
        self.imageName = worldOfImageName;
        
        NSMutableArray *arrayOfCharacters = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in worldOfCharacters) {
            Character *character = [[Character alloc]initWithName:dictionary[@"name"] imageName:dictionary[@"imageName"]];
            [arrayOfCharacters addObject:character];
        }
        
        self.characters = arrayOfCharacters;
        
    }
    
    return self;
    
}


+ (NSArray *)setArrayWithWorldAndCharacters {
    
    //init the result array
    NSMutableArray *theArrayWithWorldAndCharacters = [[NSMutableArray alloc] init];
    
    //get the plist
    NSArray *arraywithThePlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"character" ofType:@"plist"]];
    
    
    //set the result array
    for (NSDictionary *eachDictionary in arraywithThePlist){
        
        
        WorldOf *worldOf = [[WorldOf alloc] initWithName:eachDictionary[@"name"] imageName:eachDictionary[@"imageName"] characters:eachDictionary[@"characters"]];
        
        [theArrayWithWorldAndCharacters addObject:worldOf];
        
    }
    
    
    return theArrayWithWorldAndCharacters;
    
}



@end
