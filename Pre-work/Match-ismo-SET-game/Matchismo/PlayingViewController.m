//
//  PlayingViewController.m
//  Matchismo
//
//  Created by Carlos Butron on 27/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "PlayingViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingViewController ()

@end

@implementation PlayingViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
