//
//  DetailsViewController.m
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "DetailsViewController.h"
#import "ImageService.h"

@interface DetailsViewController()
@property (weak, nonatomic) IBOutlet UILabel *nameArtistDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *stageArtistDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionArtistDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageArtist;




@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameArtistDetailLabel.text = self.artist.name;
    self.stageArtistDetailLabel.text = self.artist.stage;
    self.descriptionArtistDetailLabel.text = self.artist.longDescription;
    
    ImageService *imgService = [[ImageService alloc] init];
    
    
    [imgService imageWithURL:self.artist.imageURL completion:^(UIImage *imageName) {
        
        [self.imageArtist setImage:imageName];
    }];
    
    
    
    

        

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
