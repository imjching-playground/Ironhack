//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Carlos Butron on 16/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame


- (NSUInteger)numberOfCardsToMatch
{
    if(!_numberOfCardsToMatch)_numberOfCardsToMatch = 2;
    return _numberOfCardsToMatch;
}


- (NSMutableArray*)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init]; //super's designated initializer
    
    if(self){
        for(int i=0; i < count; i++){
            
            Card *card = [deck drawRandomCard];
            
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}


- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count] ? self.cards[index] : nil);
}



static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 8;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        } else {
            NSMutableString *chosenCard = [[NSMutableString alloc] init];
            NSLog(@"card %@",card.contents);
            //match against other chosen cards
            NSMutableArray *otherCards = [[NSMutableArray alloc]init];
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    [otherCards addObject:otherCard];
                    [chosenCard appendFormat:@"%@ ", otherCard.contents];
                }
            }
            if([otherCards count] == self.numberOfCardsToMatch - 1){
                int matchScore = [card match:otherCards];
                NSLog(@"matchscore %d",matchScore);
                if(matchScore){
                    self.score += matchScore * MATCH_BONUS;
                    for(Card *otherCard in otherCards){
                        otherCard.matched = YES;
                        self.status = [[NSString stringWithFormat:@"You scored: %d points. %@", matchScore * MATCH_BONUS, card.contents] stringByAppendingString:chosenCard];
                    }
                    card.matched = YES;
                } else {
                    self.score -=MISMATCH_PENALTY;
                    for (Card *otherCard in otherCards){
                        otherCard.chosen = NO;
                    }
                    self.status = [[NSString stringWithFormat:@"You lost: %d points. %@", MISMATCH_PENALTY, card.contents] stringByAppendingString:chosenCard];
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


@end