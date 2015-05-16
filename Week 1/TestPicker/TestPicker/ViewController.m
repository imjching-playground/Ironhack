//
//  ViewController.m
//  TestPicker
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *arrayOfStuff;
@property (nonatomic, strong) NSArray *arrayOfCountries;
@property (nonatomic, strong) NSArray *arrayOfCities;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.arrayOfStuff = @[@"English", @"Spanish", @"German", @"English", @"French" ];
    self.arrayOfCountries = @[@"England", @"Spain", @"Germany", @"EEUU", @"France"];
    self.arrayOfCities = @[@"London", @"Madrid", @"Berlin", @"San Francisco", @"Paris"];
    // Connect data
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    self.textField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickersViewDataSource protocol implementation

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (component) {
        case LanguageCountryPickerColumnCountries:
            return self.arrayOfStuff.count;
            break;
        case LanguageCountryPickerColumnLanguages:
            return self.arrayOfCountries.count;
            break;
        case LanguageCountryPickerColumnCities:
            return self.arrayOfCities.count;
            break;
            
        default:
            return self.arrayOfStuff.count;
            break;
    }
    

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    switch (component) {
        case LanguageCountryPickerColumnCountries:
            return [self.arrayOfStuff objectAtIndex:row];
            break;
        case LanguageCountryPickerColumnLanguages:
            return [self.arrayOfCountries objectAtIndex:row];
            break;
            
        case LanguageCountryPickerColumnCities:
            return [self.arrayOfCities objectAtIndex:row];
            break;
            
        default:
            return [self.arrayOfStuff objectAtIndex:row];
            break;
    }
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == LanguageCountryPickerColumnCountries){
        [pickerView selectRow:row inComponent:LanguageCountryPickerColumnCities animated:YES];
        [pickerView selectRow:row inComponent:LanguageCountryPickerColumnLanguages animated:YES];
    }
    
}

#pragma -mark Hide keyboard

-(BOOL)textFieldShouldReturn:(UITextField *)myTextField{
    [myTextField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ((textField.text.length >=10) && ![string isEqualToString:@""]){
        return NO;
    }
    
    NSString *futureString = [NSString stringWithFormat:@"%@%@", self.textField.text, string];
    
    
    if ([futureString isEqualToString:@"Ironhack"]){
        self.secondTextField.text = @"cool";
        
        [self performSegueWithIdentifier: @"myironhackpush" sender: self];
        
    }
    
    
    
    return YES;
    
}


//one way to get information from another modal window
//- (IBAction)prepareForUnwind:(UIStoryboardSegue *) sender{
//
//    ModalViewController *modalVC =(ModalViewController *)sender.sourceViewController;
//    
//    [modalVC number];
//}
//
//
//// A.m file
//- (IBAction)myCancelUnwindSegueCallback:(UIStoryboardSegue *)segue {
//    //UIViewController *modalGoingAway = segue.sourceViewController;
//    // Do something (like get data) from modalGoingAway if you need to...
//    ModalViewController *modalVC =(ModalViewController *)segue.sourceViewController;
//    
//    [modalVC number];
//
//}
//
//- (IBAction)mySaveUnwindSegueCallback:(UIStoryboardSegue *)segue {
//    //UIViewController *modalGoingAway = segue.sourceViewController;
//    // Do something (like get data) from modalGoingAway if you need to...
//    ModalViewController *modalVC =(ModalViewController *)segue.sourceViewController;
//    
//    [modalVC number];
//
//}



@end
