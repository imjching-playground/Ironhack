//
//  ViewController.m
//  TVShowsCoreData
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "ViewController.h"
#import "TVShow.h"
#import "TVShowsDataManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *seasonsField;
@property (weak, nonatomic) IBOutlet UITextField *findField;
@property (weak, nonatomic) IBOutlet UILabel *foundTitle;
@property (weak, nonatomic) IBOutlet UILabel *foundSeasons;
@property TVShowsDataManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.manager = [TVShowsDataManager sharedManager];
    
}

- (IBAction)actionSave:(id)sender {
    NSString *showTitle = self.titleField.text;
    NSInteger showSeasons = [self.seasonsField.text integerValue];
    [self.manager createTVShowWithTitle:showTitle numberOfSeasons:showSeasons];
}
- (IBAction)actionFind:(id)sender {
    NSString *title = self.findField.text;
    
    TVShow *showFound = [self.manager tvShowWithTitle:title];
    
    self.foundTitle.hidden = NO;
    if (showFound) {
        self.foundTitle.text = showFound.title;
        self.foundTitle.textColor = [UIColor blackColor];
        self.foundSeasons.hidden = NO;
        self.foundSeasons.text = [NSString stringWithFormat:@"%@ seasons", showFound.numberOfSeasons];
    } else {
        self.foundTitle.text = @"Not Found";
        self.foundTitle.textColor = [UIColor redColor];
        self.foundSeasons.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
