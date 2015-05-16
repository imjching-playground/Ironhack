//
//  Recipe.m
//  Recipe
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

- (Ingredient *) addIngredient: (NSString *)name
             addWeight: (NSUInteger)weight{
    
    Ingredient *ingredient = [[Ingredient alloc] init];
    
    ingredient.name = name;
    ingredient.weight = weight;
    
    
    return ingredient;
}



- (id) initWithName: (NSString *)myName
               desc: (NSString *)myDesc
               step: (NSMutableArray *)myStep
           prepTime: (NSUInteger)myPreparationTime
           cookTime: (NSUInteger)myCookTime
             serves: (NSUInteger)myServes
        ingredients: (NSMutableArray *)myIngredients;{
    
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
