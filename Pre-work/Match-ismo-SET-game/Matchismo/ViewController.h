//
//  ViewController.h
//  Matchismo
//
//  Created by Carlos Butron on 12/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//
// Abstract cladd. Must implement methods described below

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController<UIAlertViewDelegate>

//protected
//for subclasses
-(Deck *)createDeck;  //abstract

@end

