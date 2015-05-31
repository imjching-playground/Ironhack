//
//  AllShowsViewController.m
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "AllShowsViewController.h"
#import "TVShowsDataManager.h"
#import "ShowEditViewController.h"

@interface AllShowsViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSArray *allShows;
@property TVShowsDataManager *manager;

@end

@implementation AllShowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.manager = [TVShowsDataManager sharedManager];
    self.allShows = [self.manager allTVShows];
    
    // Create the pull-to-refresh control
    self.refreshControl = [[UIRefreshControl alloc] init];
    // Set the method to call when refreshing
    [self.refreshControl addTarget:self action:@selector(refreshDidChange:) forControlEvents:UIControlEventValueChanged];
    
//    self.tableView.editing = YES;
}

- (void)refreshDidChange:(id)sender {
    // Get all the shows again and reload the tableview
    self.allShows = [self.manager allTVShows];
    [self.tableView reloadData];
    
    // Make the refresh control stop spinning
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allShows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShowCell"];
    cell.textLabel.text = [self.allShows[indexPath.row] title];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // User has pressed the button when swiping in a cell
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // We need to delete the specified TV Show
        TVShow *showToDelete = self.allShows[indexPath.row];
        [self.manager deleteTVShow:showToDelete];
        // Show is deleted from Core Data but we still have it in our array. Load all shows from core data again
        self.allShows = [self.manager allTVShows];
        
        [self.tableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ShowEditViewController *destVC = segue.destinationViewController;
    NSInteger selectedIndex = [self.tableView indexPathForSelectedRow].row;
    // Pass the selected show to the detail view controller
    destVC.show = self.allShows[selectedIndex];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Get all the shows to check if there have been changes in the Edit view
    self.allShows = [[TVShowsDataManager sharedManager] allTVShows];
    [self.tableView reloadData];
}

@end
