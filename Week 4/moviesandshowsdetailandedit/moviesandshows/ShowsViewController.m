//
//  ShowsViewController.m
//  MoviesAndShows
//
//  Created by Marc on 25/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "ShowsViewController.h"
#import "TVShow.h"
#import "PersistenceManager.h"
#import "ShowDetailViewController.h"

@interface ShowsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *shows;
@end

@implementation ShowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.shows = [NSKeyedUnarchiver unarchiveObjectWithFile:[PersistenceManager pathForFileWithClass:[TVShow class]]];
    
    if (self.shows == nil) {
        self.shows = [NSMutableArray array];
        for (int i =0; i<42; i++) {
            TVShow *show = [[TVShow alloc] init];
            show.title = [NSString stringWithFormat:@"Show %d", i];
            show.numberOfSeasons = i % 8 + 1;
            [self.shows addObject:show];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShowCell"];
    
    TVShow *show = self.shows[indexPath.row];
    
    cell.textLabel.text = show.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu Season%@", (unsigned long)show.numberOfSeasons, show.numberOfSeasons == 1 ? @"" : @"s"];
    return cell;
}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    [PersistenceManager copyEntity:self.shows atIndex:indexPath.row];
//    
//    [tableView reloadData];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
    TVShow *show = self.shows[selectedIndex.row];
    
    if ([segue.identifier isEqualToString:@"showDetalSegue"]) {
        ShowDetailViewController *vc = segue.destinationViewController;
        vc.show = show;
        vc.shows = self.shows;
        vc.showIndex = selectedIndex.row;
    }
}
- (IBAction)actionSort:(id)sender {
}

@end
