//
//  DetailViewController.m
//  Copying
//
//  Created by Carlos Butron on 25/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "DetailViewController.h"
#import "PersistenceManager.h"
#import "TVShow.h"
#import "MovieModel.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UIButton *didCopyButton;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.dataArray[self.index] isKindOfClass:[TVShow class]]){
        
        NSLog(@"vengo de tvshow");
        
        TVShow *show = self.dataArray[self.index];
        
        self.titleDetailLabel.text = show.title;

        
        
    }
    if ([self.dataArray[self.index] isKindOfClass:[MovieModel class]]){
        
        NSLog(@"vengo de movie");
        
        MovieModel * movie = self.dataArray[self.index];
        
        self.titleDetailLabel.text = movie.title;
        
        
    }
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionCopy:(id)sender {
    
    
    if ([self.dataArray[self.index] isKindOfClass:[TVShow class]]){
        
        NSLog(@"vengo de tvshow");
        
        TVShow *show = self.dataArray[self.index];
        
        show.title = self.detailTextField.text;;
        
        self.dataArray[self.index] = show;
        
        [PersistenceManager copyEntity:self.dataArray atIndex:self.index];
        
        
    }
    if ([self.dataArray[self.index] isKindOfClass:[MovieModel class]]){
        
        NSLog(@"vengo de tvshow");
        
        MovieModel *movie = self.dataArray[self.index];
        
        movie.title = self.detailTextField.text;;
        
        self.dataArray[self.index] = movie;
        
        [PersistenceManager copyEntity:self.dataArray atIndex:self.index];
        
        
    }
   
    // MAKE ALL USER INTERFACE ELEMENTS FADE OUT
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.titleDetailLabel.alpha = 0.0;
                         self.detailTextField.alpha = 0.0;
                         self.didCopyButton.alpha = 0.0;
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
                        // [self.delegate didDeleteCharacterAtIndex: self.indexPath];
                         
                         //POP TO PREVIOUS SCREEN
                         [self dismissViewControllerAnimated:YES completion:nil];
                     }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
