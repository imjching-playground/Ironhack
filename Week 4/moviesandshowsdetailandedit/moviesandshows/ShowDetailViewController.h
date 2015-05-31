//
//  ShowDetailViewController.h
//  MoviesAndShows
//
//  Created by Marc on 26/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVShow.h"

@interface ShowDetailViewController : UIViewController

@property TVShow *show;
@property NSInteger showIndex;
@property NSMutableArray *shows;

@end
