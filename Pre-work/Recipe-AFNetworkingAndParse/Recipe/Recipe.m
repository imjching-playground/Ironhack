//
//  Recipe.m
//  Recipe
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe



- (instancetype) initWithName: (NSString *)myName
               desc: (NSString *)myDesc
               step: (NSArray *)myStep
    preparationTime: (NSNumber *)myPreparationTime
           cookTime: (NSNumber *)myCookTime
             serves: (NSNumber *)myServes
        ingredients: (NSArray *)myIngredients;{
    
    if (self = [super init]) {
        
        _name = myName;
        _desc = myDesc;
        _step = myStep;
        _preparationTime = myPreparationTime;
        _cookTime = myCookTime;
        _serves = myServes;
        _ingredients = myIngredients;
        
    }
    
    return self;
    
}



@end
