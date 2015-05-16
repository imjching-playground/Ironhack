//
//  ViewController.m
//  Recipe
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *recipeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *recipeDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;
@property (weak, nonatomic) IBOutlet UITextView *stepsTextView;
@property (weak, nonatomic) IBOutlet UILabel *preparationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cookTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *serveLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self printRecipe];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) printRecipe {
    
    

    self.ingredients = [[NSMutableArray alloc] init];  //init array

    //add new recipe object
    Recipe * recipe = [[Recipe alloc] initWithName:@"Classic chocolate Brownies" desc:@"The ultimate soft and gooey brownie" step:self.steps prepTime:(int)20 cookTime:(int)30 serves:(int)16 ingredients:self.ingredients];
    
    
    //add the howto, step by step in array
    recipe.step = [@[
                   @"Preheat oven to 180⁰C, gas mark 4. Grease and line the base and sides of a 20cm square cake tin with baking parchment.",
                   @"Melt the chocolate and butter in a bowl over a pan of simmering water. Cool slightly.",
                   @"Whisk the eggs and sugar until thick and creamy, pour over the chocolate mixture and fold in.",
                   @"Sift in the flour and cocoa and fold in the nuts. Pour into the prepared tin, making sure it goes right into the corners and bake for 25-30 minutes. The top should be crusty with a slight wobble underneath.",
                   @"Cool completely in the tin (can refrigerate overnight which aids cutting) and then cut into squares or triangles."
                   ] mutableCopy];
    
    
    //add the necessaries
    [recipe.ingredients addObject:[recipe addIngredient:@"Cadbury Bournville cocoa" addWeight:(int)175]];
    [recipe.ingredients addObject:[recipe addIngredient:@"unsalted butter" addWeight:(int)175]];
    [recipe.ingredients addObject:[recipe addIngredient:@"medium eggs" addWeight:(int)3]];
    [recipe.ingredients addObject:[recipe addIngredient:@"caster sugar" addWeight:(int)250]];
    [recipe.ingredients addObject:[recipe addIngredient:@"plain flour" addWeight:(int)75]];
    [recipe.ingredients addObject:[recipe addIngredient:@"chopped walnut (Optional)" addWeight:(int)50]];
    
    //print complete recipe
    NSLog(@"\n\nName: %@\nDescription: %@\nPrep Time: %lu\nCook Time: %lu\nServes: %lu", recipe.name, recipe.desc, (unsigned long)recipe.preparationTime, (unsigned long)recipe.cookTime, (unsigned long)recipe.serves);
    NSLog(@"\nDIRECTIONS:\n");
    if([recipe.step count]){ //not null then
        for (NSString *showStep in recipe.step) { //with fast enumeration
            NSLog(@"-- %@\n", showStep);
        }
    }
    NSLog(@"\nTHE NECESSARIES:\n");
    if([recipe.ingredients count]){ //not null then
        for (Ingredient *showIngredient in recipe.ingredients) { //with fast enumeration
            NSLog(@"Name: %@, Weight: %lu gr\n",showIngredient.name, showIngredient.weight);
        }

    }
    
    
    //show recipe - storyboard
    self.cookTimeLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)recipe.cookTime];
    self.preparationTimeLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)recipe.preparationTime];
    self.serveLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)recipe.serves];
    self.recipeTitleLabel.text = recipe.name;
    self.recipeDescriptionLabel.text = recipe.desc;
    
    //show recipe DIRECTIONS - storyboard
    NSMutableString* directionsAux = [NSMutableString new];
        for (NSString *showStep in recipe.step) { //with fast enumeration
            [directionsAux appendFormat: @"-- %@\n", showStep];
        }
    [self.stepsTextView setText:directionsAux];
    
    //show recipe INGREDIENTS - storyboard
    NSMutableString* ingredientsAux = [NSMutableString new];
        for (Ingredient *showIngredient in recipe.ingredients) { //with fast enumeration
            [ingredientsAux appendFormat: @"-- %lu g  %@\n", (unsigned long)showIngredient.weight , showIngredient.name];
        }

    [self.ingredientsTextView setText:ingredientsAux];

    
}



@end
