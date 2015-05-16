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
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *string = [defaults objectForKey:@"name"];
    if(string==nil){
        NSLog(@"NSUserDefaults nil");
        
        //add the howto, step by step in array
        self.steps = @[
                    @"Preheat oven to 180⁰C, gas mark 4. Grease and line the base and sides of a 20cm square cake tin with baking parchment.",
                    @"Melt the chocolate and butter in a bowl over a pan of simmering water. Cool slightly.",
                    @"Whisk the eggs and sugar until thick and creamy, pour over the chocolate mixture and fold in.",
                    @"Sift in the flour and cocoa and fold in the nuts. Pour into the prepared tin, making sure it goes right into the corners and bake for 25-30 minutes. The top should be crusty with a slight wobble underneath.",
                    @"Cool completely in the tin (can refrigerate overnight which aids cutting) and then cut into squares or triangles."
                    ];
        
        //add the necessaries
        self.ingredients = @[
                          @"175gr Cadbury Bournville cocoa",
                          @"175gr unsalted butter",
                          @"3gr medium eggs",
                          @"250gr caster sugar",
                          @"75gr plain flour",
                          @"50gr chopped walnut (Optional)"
                             
                             ];
        //add new recipe object
        Recipe * recipe = [[Recipe alloc] initWithName:@"Classic chocolate Brownies" desc:@"The ultimate soft and gooey brownie" step:self.steps preparationTime:@20 cookTime:@30 serves:@16 ingredients:self.ingredients];
    
        

    
        // Store the data nsuserdefaults
    
        [defaults setObject:self.steps forKey:@"steps"];
        [defaults setObject:recipe.name forKey:@"name"];
        [defaults setObject:recipe.desc forKey:@"desc"];
        [defaults setObject:recipe.preparationTime forKey:@"preparationTime"];
        [defaults setObject:recipe.cookTime forKey:@"cookTime"];
        [defaults setObject:recipe.serves forKey:@"serves"];
        [defaults setObject:self.ingredients forKey:@"ingredients"];
        
        [self printRecipe:recipe];

    
    } else {
        
        NSLog(@"NSUserDefaults exist");

        // Get the stored data before the view loads
        Recipe * recipe = [[Recipe alloc] init];
        recipe.step = [defaults objectForKey:@"steps"];
        recipe.name = [defaults objectForKey:@"name"];
        recipe.desc = [defaults objectForKey:@"desc"];
        recipe.preparationTime = [defaults objectForKey:@"preparationTime"];
        recipe.cookTime = [defaults objectForKey:@"cookTime"];
        recipe.serves = [defaults objectForKey:@"serves"];
        recipe.ingredients = [defaults objectForKey:@"ingredients"];
        
        [self printRecipe:recipe];

        
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) printRecipe:(Recipe *)recipe {
    

    
    //print complete recipe
    NSLog(@"\n\nName: %@\nDescription: %@\nPrep Time: %i\nCook Time: %i\nServes: %i", recipe.name, recipe.desc, [recipe.preparationTime intValue], [recipe.cookTime intValue], [recipe.serves intValue]);
    NSLog(@"\nDIRECTIONS:\n");
    if([recipe.step count]){ //not null then
        for (NSString *showStep in recipe.step) { //with fast enumeration
            NSLog(@"-- %@\n", showStep);
        }
    }
    NSLog(@"\nTHE NECESSARIES:\n");
    if([recipe.ingredients count]){ //not null then
        for (NSString *showIngredient in recipe.ingredients) { //with fast enumeration
            NSLog(@"-- %@\n",showIngredient);
        }

    }
    
    
    //show recipe - storyboard
    self.cookTimeLabel.text = [NSString stringWithFormat:@"%i", [recipe.cookTime intValue]];
    self.preparationTimeLabel.text = [NSString stringWithFormat:@"%i", [recipe.preparationTime intValue]];
    self.serveLabel.text = [NSString stringWithFormat:@"%i", [recipe.serves intValue]];
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
        for (NSString *showIngredient in recipe.ingredients) { //with fast enumeration
            [ingredientsAux appendFormat: @"-- %@\n", showIngredient];
        }

    [self.ingredientsTextView setText:ingredientsAux];

    
}



@end
