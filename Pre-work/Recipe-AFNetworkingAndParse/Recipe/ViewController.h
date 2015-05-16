//
//  ViewController.h
//  Recipe
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface ViewController : UIViewController

@property(strong, nonatomic)NSArray *steps;
@property(strong, nonatomic)NSArray *ingredients;


- (void) printRecipe:(Recipe *)recipe;

@end

