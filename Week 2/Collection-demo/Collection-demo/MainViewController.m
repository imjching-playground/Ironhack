//
//  ViewController.m
//  Collection-demo
//
//  Created by Carlos Butron on 15/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "MainViewController.h"
#import "YorkieMenuCell.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray * namesMenu;
@property (nonatomic, strong) NSArray * imagesMenu;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.namesMenu = @[@"Hair Salon", @"Bath", @"Weight", @"Antiparasitic", @"Dental Care", @"Medicine", @"Vaccines", @"Veterinary"];
    
    self.imagesMenu = @[@"hairsalon.png", @"bath.png", @"weight.png", @"antiparasitic.png", @"dentalcare.png", @"medicine.png", @"vaccines.png", @"veterinary.png"];
    
}

//COLLECTION DATA SOURCE METHODS

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 8;
    
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YorkieMenuCell * cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"YorkieMenu" forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:self.imagesMenu[indexPath.row]];
    [cell.imageYorkieMenuCell setImage:image];
    cell.labelYorkieMenuCell.text = self.namesMenu[indexPath.row];
    
    return cell;
    
}


//change size

//- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CGFloat extraWidth = indexPath.row * 20;
//    CGSize size = CGSizeMake(100 + extraWidth, 120);
//    
//    return size;
//    
//}

//change edges

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//
//    UIEdgeInsets insets =UIEdgeInsetsMake(10, 20, 20, 20);
//
//    return insets;
//
//}





@end
