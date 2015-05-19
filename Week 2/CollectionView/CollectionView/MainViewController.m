//
//  ViewController.m
//  CollectionView
//
//  Created by Carlos Butron on 15/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"
#import "WorldOf.h"
#import "Character.h"
#import "StarWarsCell.h"
#import "SimpsonsCell.h"
#import "DetailViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) NSArray *theFinalArrayToStoryboard;
@property (nonatomic) NSInteger lastSelectedRow;
@property (nonatomic) NSInteger lastSelectedSection;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTheArray];
    
    self.title = @"TV SHOWS";
    
}



- (void)setTheArray{
    
    self.theFinalArrayToStoryboard = [WorldOf setArrayWithWorldAndCharacters];
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.theFinalArrayToStoryboard.count;
    
}


//COLLECTION DATA SOURCE METHODS

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    WorldOf *world = self.theFinalArrayToStoryboard[section];
    
    return world.characters.count;
    
    
}





-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    StarWarsCell * starwars =  [collectionView dequeueReusableCellWithReuseIdentifier:@"starwarsCollectionCell" forIndexPath:indexPath];
    SimpsonsCell * simpsons = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpsonsCollectionCell" forIndexPath:indexPath];
    
    WorldOf *worldOf = self.theFinalArrayToStoryboard[indexPath.section];
    
    
    if (indexPath.section ==0) {
        
    
    Character *characterObject = worldOf.characters[indexPath.row];
    
    
    UIImage *image = [UIImage imageNamed:characterObject.imageName];
    [starwars.cellImage setImage:image];
    starwars.backgroundColor = [UIColor blackColor];
    starwars.cellLabel.text = characterObject.name;
    
    return starwars;
    }
    
    if (indexPath.section ==1) {
        
    
            
    Character *characterObject = worldOf.characters[indexPath.row];
        
        
        UIImage *image = [UIImage imageNamed:characterObject.imageName];
        [simpsons.cellImage setImage:image];
        simpsons.backgroundColor = [UIColor yellowColor];
        simpsons.cellLabel.text = characterObject.name;
        simpsons.cellLabel.textColor = [UIColor blackColor];
        
        return simpsons;
    } else {
        
        return nil;
    }
    

    
    
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.lastSelectedSection = indexPath.section;
    self.lastSelectedRow = indexPath.row;
    return indexPath;
    
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if (([segue.identifier isEqualToString:@"SimpsonsDetailSegue"]) || ([segue.identifier isEqualToString:@"StarWarsDetailSegue"])  ) {
    
    WorldOf *worldOf = self.theFinalArrayToStoryboard[self.lastSelectedSection];
    
    Character *characterObject = worldOf.characters[self.lastSelectedRow];
    
    DetailViewController *detailVC =  segue.destinationViewController;
    
    detailVC.photo = characterObject.imageName;
    
    }
    
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *headerview = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyHeader" forIndexPath:indexPath];
       
        return headerview;
    }
    
    return nil;
}




@end
