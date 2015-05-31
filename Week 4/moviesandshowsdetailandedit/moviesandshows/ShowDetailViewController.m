//
//  ShowDetailViewController.m
//  MoviesAndShows
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "ShowDetailViewController.h"
#import "PersistenceManager.h"

@interface ShowDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *showSeasonsLabel;
@property (weak, nonatomic) IBOutlet UITextField *brandNewShowTextField;

@property TVShow *brandNewShow;
@end

@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showTitleLabel.text = self.show.title;
    self.showSeasonsLabel.text = [NSString stringWithFormat:@"%lu Season%@", (unsigned long)self.show.numberOfSeasons, self.show.numberOfSeasons == 1 ? @"" : @"s"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionCopy:(id)sender {
    self.brandNewShow = [PersistenceManager copyEntity:self.shows atIndex:self.showIndex];
    self.brandNewShowTextField.text = self.brandNewShow.title;
}

- (IBAction)actionSave:(id)sender {
    self.brandNewShow.title = self.brandNewShowTextField.text;
}

@end
