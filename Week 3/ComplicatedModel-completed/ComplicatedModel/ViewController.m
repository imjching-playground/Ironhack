//
//  ViewController.m
//  ComplicatedModel
//
//  Created by Georgios Pessios on 5/14/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "ViewController.h"
#import "ShowModel.h"
#import "CharactersViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSArray *shows;
@property(nonatomic) int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shows = [ShowModel arrayOfShows];
    self.navigationController.tabBarItem.title = @"TV SHOWS";
    self.title =@"TV SHOWS";
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"PUSHCHAR"]){
        ShowModel *theShow = self.shows[self.index];
        CharactersViewController *charVC = segue.destinationViewController;
        
        charVC.show = theShow;
    
    }



}

#pragma mark - UITableViewDataSource Protocol required methods implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return [self.shows count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHOW"];
    cell.textLabel.text= [self.shows[indexPath.row] showName];

    UIImage *showImage = [UIImage imageNamed:[self.shows[indexPath.row] showImage]];
    cell.imageView.image = showImage;;
    
    return cell;

}


#pragma mark - UITableViewDataSource Protocol required methods implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
    
}


#pragma mark - UITableViewDelegate optional methods implementation

//I can use this method if I don't have a segue!!!!

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //NSLog(@"%lu", indexPath.row);
    //self.index = (int)indexPath.row;
    //ShowModel *theShow = self.shows[indexPath.row];
    
    //CharactersViewController *charactersVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CHARACTERSVC"];
    //[self.navigationController pushViewController:charactersVC animated:YES];
    
    //charactersVC.show = theShow;
    

}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.index = (int)indexPath.row;
    
    return indexPath;
    
}

@end
