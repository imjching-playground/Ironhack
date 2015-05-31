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

// Allow magic setting url image in imageView using [imageView setImageWithURL:[NSURL URLWithString:@""]]
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *beers; // Array of Beer objects

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize our beers array
    self.beers = [NSMutableArray array];
    
    NSString *apiString = @"http://api.brewerydb.com/v2/beers?key=8c65e1f1d40ea9eaab9de54da8b5e425&abv=-10";
    // Create the manager that will perform the request
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // Tell the manager to get the url for the JSON
    [manager GET:apiString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // The manager has parsed the JSON and returns a dictionary
        // responseObject will be our dictionary
        NSLog(@"JSON: %@", responseObject);
        NSArray *beers = responseObject[@"data"]; // Array of dictionaries
        // JSON data contains an array with a dictionary for every beer
        for (NSDictionary *beerDict in beers) {
            // Create the Beer objects using Mantle
            // Adapter will try to create object of class Beer using the dictionary we pass
            NSError *error;
            Beer *beer = [MTLJSONAdapter modelOfClass:[Beer class] fromJSONDictionary:beerDict error:&error];
            if (error != nil) {
                NSLog(@"Error creating Beer: %@", error);
            } else {
                // Add the created beer to our array
                [self.beers addObject:beer];
                NSLog(@"Beer created! %@", beer.name);
            }
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Something wrong happened
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.beers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeerCell"];
    
    NSString *beerImage = [self.beers[indexPath.row] labelThumbnailURL];
    cell.textLabel.text = [self.beers[indexPath.row] name];
    cell.imageView.image = nil;
    UIImage *placeholder = [UIImage imageNamed:@"defaultBeer"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:beerImage] placeholderImage:placeholder];
    return cell;
}

@end
