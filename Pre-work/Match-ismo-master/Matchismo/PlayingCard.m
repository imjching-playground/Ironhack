//
//  PlayingCard.m
//  Matchismo
//
//  Created by Carlos Butron on 15/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] != 0) {
        if ([otherCards count] == 1) {
            PlayingCard *otherCard = [otherCards firstObject];
            if (otherCard.rank == self.rank){
                score = 4;
            } else if ([otherCard.suit isEqualToString:self.suit]){
                score=1;
            }
        
        } else if ([otherCards count] == 2) {
            PlayingCard *otherCard2 = [otherCards firstObject];
            PlayingCard *otherCard3 = [otherCards objectAtIndex:1];
            
            //for (Card *otherCard in otherCards) score += [self match:@[otherCard]];
            //PlayingCard *otherCard = [otherCards firstObject];
            //score += [otherCard match:[otherCards subarrayWithRange:NSMakeRange(1, [otherCards count] - 1)]];
            
            //Rules to play match 3 cards, with the same number or the same color
            if ((otherCard2.rank == self.rank) && (otherCard3.rank == self.rank)){
                score = 8;
            } else if (([otherCard2.suit isEqualToString:self.suit]) && ([otherCard3.suit isEqualToString:self.suit])){
                score= 2;
            }
            //ADD RULES to play set game http://en.wikipedia.org/wiki/Set_(game) 
            if ((!otherCard2.rank == self.rank) && (!otherCard3.rank == self.rank)){
                score = 8;
            } else if ((![otherCard2.suit isEqualToString:self.suit]) && (![otherCard3.suit isEqualToString:self.suit])){
                score= 2;
            }
        }
    }
    return score;
}


- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

+ (NSArray *)validSuits
{
    return @[@"♥️",@"♦️",@"♠️",@"♣️",];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {  return [[self rankStrings] count] -1 ; }

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
