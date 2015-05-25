//
//  DetailsViewController.m
//  ComplicatedModel
//
//  Created by Marin Todorov on 5/20/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (assign, nonatomic) CGPoint beginningCenter;

@end

@implementation DetailsViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    //SHOW THE CHARACTER DETAILS
    self.photo.image = [UIImage imageNamed: self.selectedCharacter.image];
    self.nameField.text = self.selectedCharacter.name;
    
    //ENABLE USER INTERACTION FOR THE IMAGE
    self.photo.userInteractionEnabled = YES;
    
    //CREATE A TAP RECOGNIZER
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    
    //ATTACH RECOGNIZER TO IMAGE VIEW
    [self.photo addGestureRecognizer:tap];
    
    //CREATE SLIDE TO LEFT RECOGNIZER
    UISwipeGestureRecognizer * panLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didPanLeft:)];
    
    panLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    //ATTACH LEFT PAN TO IMAGE VIEW
    [self.photo addGestureRecognizer:panLeft];
    
    
    
    //CREATE SLIDE TO RIGHT RECOGNIZER
    UISwipeGestureRecognizer * panRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didPanRight:)];
    
    panRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    //ATTACH RIGHT PAN TO IMAGE VIEW
    [self.photo addGestureRecognizer:panLeft];
    
    
    //CREATE PINCH RECOGNIZER
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(didPinch:)];
    
    [self.photo addGestureRecognizer:pinch];
    
    
    //CREATE PAN RECOGNIZER
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    
    [self.photo addGestureRecognizer:pan];
    
    
    //CREATE LONG PRESS RECOGNIZER
    
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongPress:)];
    
    [self.photo addGestureRecognizer:longPress];
    
    
    //CREATE DOUBLE TAP RECOGNIZER
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didDoubleTap:)];
    

    doubleTap.numberOfTapsRequired = 2;
    
    [self.photo addGestureRecognizer:doubleTap];
    
}


//REACT TO DOUBLE TAPS (E.G. numberOfTapsRequired = 2)

- (void)didDoubleTap:(UITapGestureRecognizer *)recognizer {
    
    [UIView animateWithDuration:1.0 animations:^{
        self.photo.alpha = 1;
    }];
    
}




//REACT TO LONG PRESS

- (void)didLongPress:(UILongPressGestureRecognizer *)recognizer {
    
    [UIView animateWithDuration:1.0 animations:^{
        self.photo.alpha = 0.2;
    }];
    
}




//REACT TO PAN GESTURE

- (void)didPan:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        self.beginningCenter = self.photo.center;
        
    }
    
    
    CGPoint offset = [recognizer translationInView:self.photo];
    
    self.photo.transform = CGAffineTransformMakeTranslation(offset.x, offset.y);
    
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        self.photo.transform = CGAffineTransformIdentity;
        
        self.photo.center = CGPointMake(self.beginningCenter.x + offset.x, self.beginningCenter.y + offset.y);
        
    }
    
}



//REACT TO PINCH GESTURES
- (void)didPinch:(UIPinchGestureRecognizer *)recognizer {
    
    self.photo.transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
    
}



// REACT TO TAPS FROM RECOGNIZER
- (void)didTap:(UITapGestureRecognizer *)recognizer {
    
    [self.nameField becomeFirstResponder];
    
    
}


// REACT TO SLIDER LEFT RECOGNIZER
- (void)didPanRight:(UIPanGestureRecognizer *)recognizer {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


// REACT TO SLIDER LEFT RECOGNIZER
- (void)didPanLeft:(UIPanGestureRecognizer *)recognizer {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)actionSave:(id)sender {
    
    //GET THE NEW NAME
    self.selectedCharacter.name = self.nameField.text;
    
    //CALL DELEGATE METHOD TO EDIT CHARACTER
    [self.delegate didEditCharacter:self.selectedCharacter withIndex:self.indexPath];
    
    //POP TO PREVIOUS SCREEN
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionDelete:(id)sender
{
    // MAKE ALL USER INTERFACE ELEMENTS FADE OUT
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.photo.alpha = 0.0;
                         self.nameField.alpha = 0.0;
                         self.deleteButton.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         
                         //CALL animateViewToRed WHEN FINISHED
                         [self animateViewToRed];
                     }];
}

-(void)animateViewToRed
{
    // MAKE THE VIEW CONTROLLER VIEW ANIMATE TO RED COLOR
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.view.backgroundColor = [UIColor redColor];
                     } completion:^(BOOL finished) {
                         
                         //CALL DELEGATE METHOD TO EDIT CHARACTER
                         [self.delegate didDeleteCharacterAtIndex: self.indexPath];

                         //POP TO PREVIOUS SCREEN
                         [self.navigationController popViewControllerAnimated:YES];
                     }];
}

@end
