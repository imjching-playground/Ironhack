//
//  ViewController.m
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "Artist.h"
#import "ArtistService.h"
#import "ArtistCell.h"
#import "DetailsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *artistsCopy;
@property (nonatomic, strong) NSArray *artists;
@property NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.artists = [[NSMutableArray alloc] init];
//
//    for (int i=0; i<50; i++) {
//        
//       Artist *copyArtist = [[Artist randomArtist] copy];
//        
//        
//       [self.artistsCopy addObject:copyArtist];
//        
//       
//        
//        
//        
//       NSLog(@"%@", self.artists.description);
//       
//        
//        
//    }
//    
    self.artists = [[NSArray alloc] init];
    
    
    ArtistService *artistService = [[ArtistService alloc] init];
    
    [artistService artistsWithCompletion:^(NSArray *artists) {
        
        NSLog(@"%@", artists);
        self.artists = artists;

            // We are accessing UI code, this needs to run on the main thread
        [self.tableView reloadData];
        
        
    }];
    


}

//-(void)viewWillAppear:(BOOL)animated {
//    
//    [self.tableView reloadData];
//    [super viewWillAppear:YES];
//    
//}
//
//-(void)viewDidAppear:(BOOL)animated {
//    
//    [self.tableView reloadData];
//    [super viewWillAppear:YES];
//    
//}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.index = indexPath.row;
    
    return indexPath;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.artists.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ArtistCell *artistCell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell"];
    
    artistCell.nameArtistLabel.text = [self.artists[indexPath.row] name];
    
    return artistCell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailsViewController *detailVC = segue.destinationViewController;
    
    Artist *artist = self.artists[self.index];
    
    detailVC.artist = artist;
}


@end
