//
//  ViewController.m
//  CharacterCollection
//
//  Created by Carlos Butron on 20/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "Character.h"
#import "MyCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photoMainImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameMainLabel;

@property (strong, nonatomic) NSArray *theFinalArrayToStoryboard;
@property (strong, nonatomic) NSIndexPath* lastIndex;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTheArray];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setTheArray{
    
    NSArray *theArrayOfDictionariesOfCharacters = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
    
    
    self.theFinalArrayToStoryboard = [Character theArrayOfCharactersFromDicts:theArrayOfDictionariesOfCharacters];
    
}




//COLLECTION DATA SOURCE METHODS

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return self.theFinalArrayToStoryboard.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"%ld", (long)indexPath.row);
        Character* character = self.theFinalArrayToStoryboard[indexPath.row];

        MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
        
        UIImage* photo = [UIImage imageNamed:character.photo];
        [cell.photoCollectionView setImage:photo];
    
        return cell;
    
}

//-(void)viewDidAppear:(BOOL)animated {
//    
//    [super viewDidAppear:animated];
//    
//    [UIView animateWithDuration:5.0
//                     animations:^{
//                         
//                         self.photoMainImageView.backgroundColor = [UIColor greenColor];
//                         
//                     }];
//    
//    
//}

- (IBAction)actionAnimationPhoto:(id)sender {
    
    
    
}



// FLOW LAYOUT METHODS

//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat extraWidth = indexPath.row * 20;
//    
//    CGSize size = CGSizeMake(100 + extraWidth, 120);
//    return size;
//}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
//                        layout:(UICollectionViewLayout*)collectionViewLayout
//        insetForSectionAtIndex:(NSInteger)section
//{
//    UIEdgeInsets insets = UIEdgeInsetsMake(20, 20, 20, 20);
//    return insets;
//}

-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.lastIndex = indexPath;
    
    Character* character = self.theFinalArrayToStoryboard[indexPath.row];
    
    self.nameMainLabel.text = character.name;
    
    UIImage* photo = [UIImage imageNamed:character.photo];
    [self.photoMainImageView setImage:photo];
    
    
    
    return YES;
}





@end
