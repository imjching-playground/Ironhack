//
//  Animal.m
//  OnlyAnimals
//
//  Created by Carlos Butron on 12/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "AnimalsModel.h"

@implementation AnimalsModel

+ (instancetype)sharedModel{
    
    static AnimalsModel *sharedInstance = nil;
    
    if (sharedInstance == nil) {
        
        sharedInstance = [[AnimalsModel alloc] init];
        
        NSObject *numberSaved = [[NSUserDefaults standardUserDefaults] objectForKey:@"count"];
        sharedInstance.animalCount = (int)[(NSNumber *)numberSaved integerValue];
        
    }
    
    return sharedInstance;
    
    
}

@end
