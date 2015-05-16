//
//  PlayingCard.h
//  Matchismo
//
//  Created by Carlos Butron on 15/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
