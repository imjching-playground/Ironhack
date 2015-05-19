//
//  FormViewController.m
//  ComplicatedModel
//
//  Created by Marin Todorov on 5/14/15.
//  Copyright (c) 2015 Georgios Pessios. All rights reserved.
//

#import "FormViewController.h"
#import "CharacterModel.h"

@interface FormViewController ()

@property (weak, nonatomic) IBOutlet UITextField *characterNameField;

@end

@implementation FormViewController

- (IBAction)actionSave:(id)sender {
    
    NSString* name = self.characterNameField.text;
    CharacterModel* newCharacter =
      [[CharacterModel alloc] initWithNameOfCharacter:name
                              andWithImageOfCharacter:@"lisa.png"];
    
    [self.delegate didCreateCharacter:newCharacter];
    
    [self.navigationController
        popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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