//
//  TVShowViewController.m
//  Copying
//
//  Created by Carlos Butron on 25/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "TVShowViewController.h"
#import "Beer.h"
#import "TVShow.h"
#import "PersistenceManager.h"
#import "DetailViewController.h"

@interface TVShowViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *shows; // OF MovieModel
@property NSInteger index;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TVShowViewController


-(NSMutableArray *)shows
{
    if(!_shows)
    {
        //LOAD movies from documents directory
        _shows = [NSKeyedUnarchiver unarchiveObjectWithFile:[PersistenceManager pathForFileWithClass:[TVShow class]]];
        if(!_shows)
        {
            _shows = [[NSMutableArray alloc] init];
            for(int i = 0; i < 5; i++)
            {
                TVShow *show = [[TVShow alloc]init];
                show.title = [NSString stringWithFormat:@"Cap %d", i];
                show.numberOfSeasons = i;
                [_shows addObject:show];
            }
        }
    }
    return _shows;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shows.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    TVShow *show = self.shows[indexPath.row];
    cell2.textLabel.text = show.title;
    cell2.detailTextLabel.text = [NSString stringWithFormat:@"%li",  (unsigned long)show.numberOfSeasons];
    
    return cell2;
}

//without persistence we need to use in viewcontroller
//LOAD movies from documents directory
//_shows = [NSKeyedUnarchiver unarchiveObjectWithFile:[self moviesFile]];

//-(NSString *)moviesFile
//{
//    
//    //NSCachesDirectory - it may be erasable
//    //NSDocumentDirectory - it's permanent
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths firstObject];
//    return [documentsDirectory stringByAppendingString:@"/tvshow.dat"];
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // Copy movies array then add to table
//    
//    TVShow *selectedShow = self.shows[indexPath.row];
//    
//    TVShow *copyShow = [selectedShow copy];
//    
//    NSLog(@"%d", [copyShow isEqual:selectedShow]);
//    
//    //Add word (Copied) to movie name
//    copyShow.title = [copyShow.title stringByAppendingString:@" (Copied)"];
//    
//    [self.shows insertObject:copyShow atIndex:indexPath.row+1];
//    
//    //SAVE movies from documents directory
//    [NSKeyedArchiver archiveRootObject:self.shows toFile:[PersistenceManager pathForFileWithClass:[TVShow class]]];
//    
//    [tableView reloadData];
    
    [PersistenceManager copyEntity:self.shows atIndex:indexPath.row];
    
    [tableView reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *detailVC = segue.destinationViewController;
    
    detailVC.dataArray = self.shows;
    detailVC.index = self.index;
    
    
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //STORE WHICH CELL WAS CLICKED to pass to the segue
    self.index = indexPath.row;
    return indexPath;
}


-(void)viewDidAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

@end
