//
//  ViewController.m
//  penguine-test
//
//  Created by Marin Todorov on 5/21/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *penguinView;
@property (strong, nonatomic) NSArray* frames;

@property (assign, nonatomic) CGPoint dieCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage* image1 = [UIImage imageNamed:@"penguin_walk01"];
    UIImage* image2 = [UIImage imageNamed:@"penguin_walk02"];
    UIImage* image3 = [UIImage imageNamed:@"penguin_walk03"];
    UIImage* image4 = [UIImage imageNamed:@"penguin_walk04"];
    
    self.frames = @[image1, image2, image3, image4];
    
    self.penguinView.animationDuration = 0.15;
    self.penguinView.animationRepeatCount = 2;
    self.penguinView.animationImages = self.frames;
    
    //walk left
    UISwipeGestureRecognizer* swipeLeft =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(walkLeft:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: swipeLeft];
    
    //walk right
    UISwipeGestureRecognizer* swipeRight =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(walkRight:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: swipeRight];
    
    //jump
    UITapGestureRecognizer* tap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jump:)];
    [self.view addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer* longPress =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(longPress:)];
    [self.penguinView addGestureRecognizer:longPress];
}

- (IBAction)walkLeft:(id)sender {
    NSLog(@"walk left");
    //CHECK IF OUT OF SCREEN
    if (self.penguinView.center.x < 0.0) {
        self.penguinView.center =
        CGPointMake(self.view.frame.size.width,
                    self.penguinView.center.y);
    }
    
    //FLIP AROUND FOR WALKING LEFT
    self.penguinView.transform =
    CGAffineTransformMakeScale(-1.0, 1.0);

    //START WALK ANIMATION
    [self.penguinView startAnimating];
    
    //MOVE THE IMAGE VIEW TO LEFT
    [UIView animateWithDuration:0.6
                     animations:^{
                         
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x - 30,
                                     self.penguinView.center.y);
                         
                     }];
    
}
- (IBAction)walkRight:(id)sender {
    NSLog(@"walk right");
    
    if (self.penguinView.center.x > self.view.frame.size.width) {
        self.penguinView.center =
        CGPointMake(0, self.penguinView.center.y);
    }
    
    self.penguinView.transform = CGAffineTransformIdentity;
    
    [self.penguinView startAnimating];
    
    [UIView animateWithDuration:0.6
                     animations:^{
                         
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x + 30,
                                     self.penguinView.center.y);
                         
                     }];

}

-(void)jump:(UITapGestureRecognizer*)tap
{
    [self.penguinView startAnimating];
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x,
                                     self.penguinView.center.y - 50);
                         
                     } completion:^(BOOL finished) {
                         [self jumpBack];
                     }];
}
-(void)jumpBack
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x,
                                     self.penguinView.center.y + 50);
                         
                     } completion:^(BOOL finished) {
                         //
                     }];
    
}

-(void)longPress:(UILongPressGestureRecognizer*)recognizer
{
    if (recognizer.state!=UIGestureRecognizerStateBegan) {
        return;
    }
    
    [UIView animateWithDuration:0.33
                     animations:^{
                         self.dieCenter = self.penguinView.center;
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x,
                                     self.view.frame.size.height);
                         
                     }
                     completion:^(BOOL finished) {
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x,
                                     0);

                         [self longPressBack];
     }];
}

-(void)longPressBack {
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.penguinView.center = self.dieCenter;
                     }];
}

@end
