//
//  ViewController.m
//  Copying
//
//  Created by Filipe Patrício on 25/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "ViewController.h"
#import "Beer.h"
#import "MovieModel.h"
#import "PersistenceManager.h"
#import "DetailViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *movies; // OF MovieModel
@property NSInteger index;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

-(NSMutableArray *)movies
{
    if(!_movies)
    {
//LOAD movies from documents directory
        _movies = [NSKeyedUnarchiver unarchiveObjectWithFile:[PersistenceManager pathForFileWithClass:[MovieModel class]]];
        if(!_movies)
        {
            _movies = [[NSMutableArray alloc] init];
            for(int i = 0; i < 5; i++)
            {
                MovieModel *movie = [[MovieModel alloc]init];
                movie.title = [NSString stringWithFormat:@"Movie %d", i];
                movie.director = [NSString stringWithFormat:@"Director %d", i];
                [_movies addObject:movie];
            }
        }
    }
    return _movies;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    MovieModel *movie = self.movies[indexPath.row];
    cell.textLabel.text = movie.title;
    cell.detailTextLabel.text = movie.director;
    
    return cell;
}

//-(NSString *)moviesFile
//{
//    
//    //NSCachesDirectory - it may be erasable
//    //NSDocumentDirectory - it's permanent
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths firstObject];
//    return [documentsDirectory stringByAppendingString:@"/movies.dat"];
//}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // Copy movies array then add to table
//    
//    MovieModel *selectedMovie = self.movies[indexPath.row];
//    
//    MovieModel *copyMovie = [selectedMovie copy];
//    
//    NSLog(@"%d", [copyMovie isEqual:selectedMovie]);
//    
//    //Add word (Copied) to movie name
//    copyMovie.name = [copyMovie.name stringByAppendingString:@" (Copied)"];
//    
//    [self.movies insertObject:copyMovie atIndex:indexPath.row+1];
//    
////SAVE movies from documents directory
//    [NSKeyedArchiver archiveRootObject:self.movies toFile:[PersistenceManager pathForFileWithClass:[MovieModel class]]];
//    
//    [tableView reloadData];
    
    // copyEntity:(NSMutableArray *)array atIndex:(NSInteger)index
    
    [PersistenceManager copyEntity:self.movies atIndex:indexPath.row];
    
    [tableView reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *detailVC = segue.destinationViewController;
    
    detailVC.dataArray = self.movies;
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
