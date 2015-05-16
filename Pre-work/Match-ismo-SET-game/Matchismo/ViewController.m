//
//  ViewController.m
//  Matchismo
//
//  Created by Carlos Butron on 12/04/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) UIAlertView *resetAlert;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
@property (weak, nonatomic) IBOutlet UILabel *lastMove;

@end

@implementation ViewController

-(CardMatchingGame *)game{
    
    if(!_game)  _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
        
    return _game;
    
    
 
    
    
}




-(Deck *)createDeck{  //abstract
    
    return nil;
    
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    [self.gameMode setEnabled:NO ]; //disable game mode
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    
}

-(void)updateUI{
    
    
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton]; //
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        self.lastMove.text = self.game.status;

    }
    
    
    
    
}


- (IBAction)touchRestartButtton:(UIButton *)sender {
    UIAlertController *resetAlert= [UIAlertController
                                    alertControllerWithTitle:@"Are you sure you want to reset?"
                                    message:@"The game will reset after clicking OK"
                                    preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OK = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self.gameMode setEnabled:YES];
                             [self.gameMode setSelectedSegmentIndex:0];
                             
                             self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
                             [self updateUI];
                             [resetAlert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction *Cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [resetAlert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [resetAlert addAction:OK];
    [resetAlert addAction:Cancel];
    [self presentViewController:resetAlert animated:YES completion:nil];
    
    
}



-(NSString *)titleForCard:(Card *) card{
    
    return card.isChosen ? card.contents : @"";
    
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
    
}


- (IBAction)numberOfCardsToMatch:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 1){
        self.game.numberOfCardsToMatch = 3;
        
    }else{
        self.game.numberOfCardsToMatch = 2;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
