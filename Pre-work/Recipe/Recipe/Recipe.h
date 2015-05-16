//
//  Recipe.h
//  Recipe
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ingredient.h"

@interface Recipe : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSMutableArray *step;
@property (strong, nonatomic) NSMutableArray *ingredients;
@property (nonatomic) NSUInteger preparationTime;
@property (nonatomic) NSUInteger cookTime;
@property (nonatomic) NSUInteger serves;


- (id) initWithName: (NSString *)myName
               desc: (NSString *)myDesc
               step: (NSMutableArray *)myStep
           prepTime: (NSUInteger)myPreparationTime
           cookTime: (NSUInteger)myCookTime
             serves: (NSUInteger)myServes
        ingredients: (NSMutableArray *)myIngredients;


- (Ingredient *) addIngredient: (NSString *)name
                     addWeight: (NSUInteger)weight ;

@end
