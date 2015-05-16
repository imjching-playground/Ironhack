//
//  ViewController.m
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"
#import "WorldOf.h"
#import "CharacterViewController.h"
#import "MyCell.h"

@interface MainViewController ()

@property (strong, nonatomic) NSArray *theFinalArrayToStoryboard;
@property (nonatomic) NSInteger lastSelectedRow;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setTheArray];
    
    
}




- (void)setTheArray{
    
    self.theFinalArrayToStoryboard = [WorldOf setArrayWithWorldAndCharacters];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection: %lu", section);
    
        
    return self.theFinalArrayToStoryboard.count;
        

    
}

//size of cells

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (indexPath.section == 0) {
//        return 50;
//    }
//    if (indexPath.section == 2) {
//        return 200;
//    } else {
//        
//        
//        
//        return 100;
//    }
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cell for path: %lu, %lu", indexPath.section, indexPath.row);
    UITableViewCell *world =[tableView dequeueReusableCellWithIdentifier:@"worldCell"];
        
        WorldOf *worldOf = self.theFinalArrayToStoryboard[indexPath.row];
        
        UIImage *photo = [UIImage imageNamed:worldOf.imageName];
        [world.imageView setImage:photo];
        world.textLabel.text = worldOf.name;
    
        return world;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"World of characters";
    
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return @"That's all";
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

//    WorldOf *worldOf = self.theFinalArrayToStoryboard[indexPath.row];
//    
//    CharacterViewController * characterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"characterID"];
//    
// //   [self.navigationController pushViewController:characterVC animated:YES];
//    
//    characterVC.worldOfObject = worldOf;
//    

    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.lastSelectedRow = indexPath.row;
    return indexPath;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WorldOf *worldOf = self.theFinalArrayToStoryboard[self.lastSelectedRow];
    
    CharacterViewController * characterVC = segue.destinationViewController;
    characterVC.worldOfObject = worldOf;
    
}



@end
