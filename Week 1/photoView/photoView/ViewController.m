//
//  ViewController.m
//  photoView
//
//  Created by Carlos Butron on 06/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "Painting.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photoImageViewStoryboard;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *geniusLabel;
@property (strong, nonatomic) NSArray *theFinalArrayToStoryboard;
@property (weak, nonatomic) IBOutlet UIButton *previousButtonProperty;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonProperty;

@property NSInteger index;

@end

@implementation ViewController


- (IBAction)nextPhotoButton:(UIButton *)sender {
    [self validateIndexOfArray:++self.index];
    [self printThePhoto:self.index];
}


- (IBAction)previousPhotoButton:(UIButton *)sender {
    [self validateIndexOfArray:--self.index];
    [self printThePhoto:self.index];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.previousButtonProperty setEnabled:NO];
    [self.previousButtonProperty setAlpha:0.4];
    self.index = 0;
    
    [self setTheArray];
    [self printThePhoto:self.index];

}




- (void)setTheArray{
    
    NSArray *theArrayOfDictionariesOfPhotos = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"photos" ofType:@"plist"]];
    
    Painting *painting = [[Painting alloc] init];
    
    self.theFinalArrayToStoryboard = [painting theArrayOfPhotosFromDicts:theArrayOfDictionariesOfPhotos];
    
}

- (void)printThePhoto:(NSInteger)arrayIndex{
    
    UIImage *image = [UIImage imageNamed:[[self.theFinalArrayToStoryboard objectAtIndex:arrayIndex] photoName]];
    [self.photoImageViewStoryboard setImage:image];
    
    self.titleLabel.text = [[self.theFinalArrayToStoryboard objectAtIndex:arrayIndex] photoTitle];
    
    if ([[[self.theFinalArrayToStoryboard objectAtIndex:arrayIndex] genius] isEqual: @1]){
        self.geniusLabel.text = @"Actor";
    } else {
        self.geniusLabel.text = @"Genius";
    }
    
}

- (void)validateIndexOfArray:(NSInteger)arrayIndex{
    
    if (arrayIndex==0) {
            [self.previousButtonProperty setEnabled:NO];
            [self.previousButtonProperty setAlpha:0.4];
    }else if (arrayIndex==1){
            [self.previousButtonProperty setEnabled:YES];
            [self.previousButtonProperty setAlpha:1];
    }else if (arrayIndex==[self.theFinalArrayToStoryboard count]-1){
            [self.nextButtonProperty setEnabled:NO];
            [self.nextButtonProperty setAlpha:0.4];
    } else if (arrayIndex==[self.theFinalArrayToStoryboard count]-2){
            [self.nextButtonProperty setEnabled:YES];
            [self.nextButtonProperty setAlpha:1];
    } 
}



@end
