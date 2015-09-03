//
//  ShowDetailViewController.m
//  Models
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import "ShowDetailViewController.h"

#import "BlockButtonItem.h"
#import "UIAlertView+Block.h"

#import "Show.h"

#import <extobjc.h>

@interface ShowDetailViewController ()

@property (nonatomic, weak) Show *show;

@property (nonatomic, weak) IBOutlet UILabel *detailLabel;
@property (nonatomic, weak) IBOutlet UIImageView *detailImageView;

@end

@implementation ShowDetailViewController

- (instancetype)initWithShow:(Show *)show
{
    if (self = [super init])
    {
        _show = show;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.detailLabel.text = self.show.showDescription;
    self.detailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.show.posterURL]];

    self.navigationItem.rightBarButtonItem = [[BlockButtonItem alloc] initWithTitle:@"Like" block:^{
        
        [[UIAlertView alertViewWithTitle:@"Liked!" message:@"Show liked" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Whatever"] onDismiss:^(NSInteger buttonIndex) {
            
            NSLog(@"Dismissed index %@", @(buttonIndex));
            
        } onCancel:^{
            
            NSLog(@"Cancelled");
        }] show];
        
    }];
}

@end
