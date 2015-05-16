//
//  ViewController.m
//  Storyboard101
//
//  Created by Carlos Butron on 06/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ironhackLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starwarsImage;


@end


int value = 0;

@implementation ViewController

@synthesize starwarsImage;

- (IBAction)pressMainButtonToGoNewViewControllerXib:(id)sender {
    
    NewViewController *newVC = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
    
    [self presentViewController:newVC animated:YES completion:nil];
    
}

- (IBAction)increment:(id)sender {
    
    self.ironhackLabel.text = [NSString stringWithFormat:@"%d", value++];
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ironhackLabel.text = [NSString stringWithFormat:@"%d", value];
    
    UIImage *image = [UIImage imageNamed:@"starwars.jpg"];
    
    //self.starwarsImage.image = image;
    [starwarsImage setImage:image];
    
    UILabel *lblNotAbove = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    lblNotAbove.text = @"testest";
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //start here the WEDNESDAY ASSIGNMENT photo
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
