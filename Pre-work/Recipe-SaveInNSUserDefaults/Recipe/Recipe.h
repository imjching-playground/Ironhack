//
//  Recipe.h
//  Recipe
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSArray *step;
@property (strong, nonatomic) NSArray *ingredients;
@property (nonatomic) NSNumber *preparationTime;
@property (nonatomic) NSNumber *cookTime;
@property (nonatomic) NSNumber *serves;


- (id) initWithName: (NSString *)myName
               desc: (NSString *)myDesc
               step: (NSArray *)myStep
    preparationTime: (NSNumber *)myPreparationTime
           cookTime: (NSNumber *)myCookTime
             serves: (NSNumber *)myServes
        ingredients: (NSArray *)myIngredients;


@end
