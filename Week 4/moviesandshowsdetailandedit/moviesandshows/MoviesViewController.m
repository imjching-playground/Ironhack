//
//  MoviesViewController.m
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "MoviesViewController.h"
#import "Movie.h"
#import "PersistenceManager.h"

@interface MoviesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *movies;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Load from disk
    self.movies = [NSKeyedUnarchiver unarchiveObjectWithFile:[PersistenceManager pathForFileWithClass:[Movie class]]];
    
    // First time initialization
    if (self.movies == nil) {
        self.movies = [NSMutableArray array];
        for (int i = 0; i < 42; i++) {
            Movie *movie = [[Movie alloc] init];
            movie.title = [NSString stringWithFormat:@"Movie %d", i];
            movie.director = [NSString stringWithFormat:@"Director %d", i];
            [self.movies addObject:movie];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate/DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    Movie *movie = self.movies[indexPath.row];
    cell.textLabel.text = movie.title;
    cell.detailTextLabel.text = movie.director;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [PersistenceManager copyEntity:self.movies atIndex:indexPath.row];
    
    [tableView reloadData];
}

@end
