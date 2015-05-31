//
//  ViewController.m
//  AFBeers
//
//  Created by Marc on 27/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>
#import "Beer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *apiString = @"http://api.brewerydb.com/v2/beers?key=8c65e1f1d40ea9eaab9de54da8b5e425&abv=-10";
    // Create the manager that will perform the request
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // Tell the manager to get the url for the JSON
    [manager GET:apiString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // The manager has parsed the JSON and returns a dictionary
        // responseObject will be our dictionary
        NSLog(@"JSON: %@", responseObject);
        NSArray *beers = responseObject[@"data"];
        // JSON data contains an array with a dictionary for every beer
        for (NSDictionary *beerDict in beers) {
            // Create the Beer objects using Mantle
            // Adapter will try to create object of class Beer using the dictionary we pass
            NSError *error;
            Beer *beer = [MTLJSONAdapter modelOfClass:[Beer class] fromJSONDictionary:beerDict error:&error];
            if (error != nil) {
                NSLog(@"Error creating Beer: %@", error);
            } else {
                NSLog(@"Beer created! %@", beer.name);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Something wrong happened
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
