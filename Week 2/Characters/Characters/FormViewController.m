//
//  FormViewController.m
//  Characters
//
//  Created by Carlos Butron on 14/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "FormViewController.h"


@interface FormViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameCharacterTextField;

@end

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSave:(id)sender {
    
    NSString * name = self.nameCharacterTextField.text;
    
    Character * character = [[Character alloc] initWithName:name imageName:@"lisa.png"];
    
    [self.delegate formViewcontroller:self didcreateCharacter:character];
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
