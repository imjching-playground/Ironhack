//
//  DetailViewController.h
//  OnlyBeers
//
//  Created by Carlos Butron on 08/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "Country.h"


//PROTOCOL
@class DetailViewController;

@protocol DetailViewControllerDelegate <NSObject>

- (void)addItemViewController:(DetailViewController *)controller
        didFinishEnteringItem:(NSString *)item;

@end
// END PROTOCOL



//properties where recived the data from MainViewController show segue

@interface DetailViewController : UIViewController
@property (strong, nonatomic) Beer *currentBeer;
@property (strong, nonatomic) Country *currentCountry;

//DELEGATE
@property (nonatomic, weak) id <DetailViewControllerDelegate> delegate;


@end
